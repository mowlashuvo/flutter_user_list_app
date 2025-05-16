import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/http_client/exception.dart';
import '../../../../core/http_client/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  // Implement repository logic
  final UserRemoteDataSource _remoteDataSource;

  const UserRepositoryImpl({required UserRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUser({required int page, required int limit}) async {
    try {
      final result = await _remoteDataSource.getUser(page: page, limit: limit);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('No Internet Connection'));
    } on SocketException {
      return const Left(ConnectionFailure('No Internet Connection'));
    } on AuthException {
      return const Left(AuthFailure(''));
    }
  }
}