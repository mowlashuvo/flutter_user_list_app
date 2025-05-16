import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _repository;

  UserUseCase({required UserRepository repository}) : _repository = repository;

  // Define your use case logic
  Future<Either<Failure, UserEntity>> getUser(
      {required int page, required int limit}) {
    return _repository.getUser(page: page, limit: limit);
  }
}
