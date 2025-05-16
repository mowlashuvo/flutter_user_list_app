part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserLoadEvent extends UserEvent {
  final int page;
  final int limit;

  const UserLoadEvent({
    this.page = 1,
    this.limit = 10,
  });

  @override
  List<Object?> get props => [page, limit];
}

class UserRefreshEvent extends UserEvent {
  final int page;
  final int limit;

  const UserRefreshEvent({
    this.page = 1,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [page, limit];
}

class UserSearchEvent extends UserEvent {
  final String query;

  const UserSearchEvent({
    this.query='',
  });

  @override
  List<Object?> get props => [query];
}