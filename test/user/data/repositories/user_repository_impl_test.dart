import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_user_list_app/core/http_client/exception.dart';
import 'package:flutter_user_list_app/core/http_client/failure.dart';
import 'package:flutter_user_list_app/features/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_user_list_app/features/user/data/models/user_model.dart';
import 'package:flutter_user_list_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late UserRepositoryImpl repository;
  late MockUserRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    repository = UserRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final userModel = UserModel(
    page: 1,
    perPage: 10,
    total: 100,
    totalPages: 10,
    data: [
      UserDataModel(
        id: 1,
        email: 'john.doe@example.com',
        firstName: 'John',
        lastName: 'Doe',
        avatar: 'https://example.com/avatar.png',
      ),
    ],
  );

  test('should return Right(UserEntity) when data source call is successful', () async {
    when(() => mockRemoteDataSource.getUser(page: 1, limit: 10))
        .thenAnswer((_) async => userModel);

    final result = await repository.getUser(page: 1, limit: 10);

    expect(result.isRight(), true);
    result.fold(
          (_) => null,
          (userEntity) {
        expect(userEntity.data?.length, 1);
        expect(userEntity.data?.first.firstName, 'John');
      },
    );

    verify(() => mockRemoteDataSource.getUser(page: 1, limit: 10)).called(1);
  });

  test('should return Left(ServerFailure) when ServerException is thrown', () async {
    when(() => mockRemoteDataSource.getUser(page: 1, limit: 10))
        .thenThrow(const ServerException('No Internet Connection'));

    final result = await repository.getUser(page: 1, limit: 10);

    expect(result.isLeft(), true);
    result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => null,
    );

    verify(() => mockRemoteDataSource.getUser(page: 1, limit: 10)).called(1);
  });

  test('should return Left(ConnectionFailure) when SocketException is thrown', () async {
    when(() => mockRemoteDataSource.getUser(page: 1, limit: 10))
        .thenThrow(SocketException('No Internet'));

    final result = await repository.getUser(page: 1, limit: 10);

    expect(result.isLeft(), true);
    result.fold(
          (failure) => expect(failure, isA<ConnectionFailure>()),
          (_) => null,
    );

    verify(() => mockRemoteDataSource.getUser(page: 1, limit: 10)).called(1);
  });

  test('should return Left(AuthFailure) when AuthException is thrown', () async {
    when(() => mockRemoteDataSource.getUser(page: 1, limit: 10))
        .thenThrow(AuthException('Unauthorized'));

    final result = await repository.getUser(page: 1, limit: 10);

    expect(result.isLeft(), true);
    result.fold(
          (failure) => expect(failure, isA<AuthFailure>()),
          (_) => null,
    );

    verify(() => mockRemoteDataSource.getUser(page: 1, limit: 10)).called(1);
  });
}
