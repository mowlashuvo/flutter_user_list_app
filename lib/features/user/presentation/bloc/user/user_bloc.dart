import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _useCase;
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isLoading = false;
  List<UserDataEntity> userList = [];

  String getPageCacheKey(int page) => 'user_list_page_$page';
  String cachedPageTimestampKey = 'user_list_page_timestamp';
  final Duration cacheValidity = Duration(hours: 10);
  final box = GetStorage();


  UserBloc({
    required UserUseCase useCase,
  })  : _useCase = useCase,
        super(const UserLoadingState()) {
    on<UserLoadEvent>(_onLoadUser);
    on<UserRefreshEvent>(_onRefresh);
    on<UserSearchEvent>(_onUserSearch);
  }

  Future<void> _onLoadUser(
      UserLoadEvent event,
      Emitter<UserState> emit,
      ) async {
    if (hasReachedMax || isLoading) return;

    isLoading = true;

    final pageKey = getPageCacheKey(event.page);
    final cachedPageJson = box.read(pageKey);
    final cachedPageTimestampStr = box.read('$cachedPageTimestampKey${event.page}');

    bool useCache = false;

    if (cachedPageJson != null && cachedPageTimestampStr != null) {
      final cachedTimestamp = DateTime.parse(cachedPageTimestampStr);
      if (DateTime.now().difference(cachedTimestamp) < cacheValidity) {
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
    final result = await _useCase.getUser(page: event.page, limit: event.limit);

    result.fold((failure) {
      emit(UserErrorState(error: failure.message));
      isLoading = false;
    }, (data) {
      final pageData = data.data ?? [];

      if ((data.totalPages ?? 0) <= currentPage) {
        hasReachedMax = true;
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
        box.write(pageKey, pageData.map((e) => e.toJson()).toList());
        box.write('$cachedPageTimestampKey${event.page}', DateTime.now().toIso8601String());

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
      box.remove(getPageCacheKey(i));
      box.remove('$cachedPageTimestampKey$i');
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
        box.write(getPageCacheKey(1), pageData.map((e) => e.toJson()).toList());
        box.write('$cachedPageTimestampKey''1', DateTime.now().toIso8601String());

        currentPage++;
      }

      isLoading = false;
    });
  }



  Future<void> _onUserSearch(
    UserSearchEvent event,
    Emitter<UserState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(UserSuccessState(
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));
      return;
    }

    final filteredUsersFirstName = userList
        .where((user) {
          return user.firstName?.toLowerCase().contains(event.query.toLowerCase())??false;
        })
        .toList();

    final filteredUsersLastName = userList
        .where((user) {
          return user.lastName?.toLowerCase().contains(event.query.toLowerCase())??false;
        })
        .toList();

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
