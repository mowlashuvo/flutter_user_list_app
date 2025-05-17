import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../my_app.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/user_usecase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _useCase;
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isLoading = false;
  bool _hasShownSnackBar = false;
  List<UserDataEntity> userList = [];

  String getPageCacheKey(int page) => 'user_list_page_$page';
  String cachedPageTimestampKey = 'user_list_page_timestamp';
  final Duration cacheValidity = Duration(hours: 10);
  final GetStorage _box;

  UserBloc({
    required UserUseCase useCase,
    required GetStorage box,
  })  : _useCase = useCase,
        _box = box,
        super(const UserLoadingState()) {
    on<UserLoadEvent>(_onLoadUser, transformer: droppable());
    on<UserRefreshEvent>(_onRefresh);
    on<UserSearchEvent>(_onUserSearch);
  }

  Future<void> _onLoadUser(
    UserLoadEvent event,
    Emitter<UserState> emit,
  ) async {
    if(hasReachedMax){
      rootScaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('No more data available'),
        ),
      );
      return;
    }
    if (hasReachedMax || isLoading) return;
    isLoading = true;
    if (currentPage != 1) {
      emit(UserSuccessState(
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        isLoadingMore: true,
      ));
    }
    final pageKey = getPageCacheKey(currentPage);
    final cachedPageJson = _box.read(pageKey);
    final cachedPageTimestampStr =
        _box.read('$cachedPageTimestampKey$currentPage');

    bool useCache = false;

    if (cachedPageJson != null && cachedPageTimestampStr != null) {
      final cachedTimestamp = DateTime.parse(cachedPageTimestampStr);
      final cachedPageList = (cachedPageJson as List)
          .map((e) => UserDataEntity.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      if (DateTime.now().difference(cachedTimestamp) < cacheValidity && cachedPageList.isNotEmpty) {
        useCache = true;
      }
    }

    if (useCache) {
      final cachedPageList = (cachedPageJson as List)
          .map((e) => UserDataEntity.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      userList.addAll(cachedPageList);
      currentPage++;

      emit(UserSuccessState(
        data: List.from(userList),
        hasReachedMax: false,
        isLoadingMore: false,
      ));

      isLoading = false;
      return;
    }
    // Load from API if no valid cache
    final result = await _useCase.getUser(page: currentPage, limit: 10);

    result.fold((failure) {
      if(!_hasShownSnackBar){
        _hasShownSnackBar = true;
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(failure.message),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                // Retry the same event
                add(UserLoadEvent());
              },
            ),
          ),
        );
      }
      emit(UserSuccessState(
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));
      isLoading = false;
    }, (data) {
      _hasShownSnackBar = false;
      final pageData = data.data ?? [];
      if ((data.totalPages ?? 0) <= currentPage) {
        hasReachedMax = true;
      }

      if(pageData.isEmpty){
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text('No more data available'),
          ),
        );
      }

      if (pageData.isEmpty && userList.isEmpty) {
        emit(const UserErrorState(error: 'No data found'));
      } else {
        userList.addAll(pageData);

        emit(UserSuccessState(
          data: List.from(userList),
          hasReachedMax: hasReachedMax,
          isLoadingMore: false,
        ));

        // Save each page to cache
        _box.write(pageKey, pageData.map((e) => e.toJson()).toList());
        _box.write('$cachedPageTimestampKey$currentPage',
            DateTime.now().toIso8601String());

        currentPage++;
      }

      isLoading = false;
    });
  }

  Future<void> _onRefresh(
    UserRefreshEvent event,
    Emitter<UserState> emit,
  ) async {
    currentPage = 1;
    hasReachedMax = false;
    isLoading = true;

    // 🚫 Clear all cached pages
    for (int i = 1; i <= 100; i++) {
      _box.remove(getPageCacheKey(i));
      _box.remove('$cachedPageTimestampKey$i');
    }

    userList.clear();

    final result = await _useCase.getUser(page: event.page, limit: event.limit);

    result.fold((failure) {
      emit(UserErrorState(error: failure.message));
      isLoading = false;
    }, (data) {
      final pageData = data.data ?? [];

      if ((data.totalPages ?? 0) <= currentPage) {
        hasReachedMax = true;
      }

      userList.addAll(pageData);

      if (userList.isEmpty) {
        emit(const UserErrorState(error: 'No data found'));
      } else {
        emit(UserSuccessState(
          data: List.from(userList),
          hasReachedMax: hasReachedMax,
          isLoadingMore: false,
        ));

        // Cache page 1
        _box.write(
            getPageCacheKey(1), pageData.map((e) => e.toJson()).toList());
        _box.write(
            '$cachedPageTimestampKey' '1', DateTime.now().toIso8601String());

        currentPage++;
      }

      isLoading = false;
    });
  }

  Future<void> _onUserSearch(
    UserSearchEvent event,
    Emitter<UserState> emit,
  ) async {
    final query = event.query.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    if (query.isEmpty) {
      emit(UserSuccessState(
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));
      return;
    }

    final filteredUsersFirstName = userList.where((user) {
      return user.firstName
              ?.toLowerCase()
              .contains(query.toLowerCase()) ??
          false;
    }).toList();

    final filteredUsersLastName = userList.where((user) {
      return user.lastName?.toLowerCase().contains(query.toLowerCase()) ??
          false;
    }).toList();

    List<UserDataEntity> filteredUser = [];

    filteredUser.addAll(filteredUsersFirstName);
    filteredUser.addAll(filteredUsersLastName);

    emit(UserSuccessState(
      data: filteredUser,
      hasReachedMax: hasReachedMax,
      isLoadingMore: false,
    ));
  }
}
