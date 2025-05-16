part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UserLoadingState extends UserState {
  final String? message;

  const UserLoadingState({this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class UserSuccessState extends UserState {
  final List<UserDataEntity> data;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const UserSuccessState({
    required this.data,
    required this.hasReachedMax,
    this.isLoadingMore = false,
  });
  UserSuccessState copyWith({
    List<UserDataEntity>? data,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return UserSuccessState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
  @override
  List<Object?> get props => [data, hasReachedMax, isLoadingMore];
}

class UserErrorState extends UserState {
  final String error;

  const UserErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}