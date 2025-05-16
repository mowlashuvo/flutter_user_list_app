import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_user_list_app/core/http_client/client.dart';
import 'package:flutter_user_list_app/core/http_client/exception.dart';
import 'package:flutter_user_list_app/features/user/data/datasources/user_remote_datasource.dart';
import 'package:flutter_user_list_app/features/user/data/models/user_model.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseApiClient extends Mock implements BaseApiClient {}

void main() {
  late UserRemoteDataSourceImpl dataSource;
  late MockBaseApiClient mockClient;

  setUp(() {
    mockClient = MockBaseApiClient();
    dataSource = UserRemoteDataSourceImpl(client: mockClient);
  });

  final tResponse = {
    "page": 1,
    "per_page": 10,
    "total": 100,
    "total_pages": 10,
    "data": [
      {
        "id": 1,
        "email": "john.doe@example.com",
        "first_name": "John",
        "last_name": "Doe",
        "avatar": "https://example.com/avatar.png"
      }
    ]
  };

  test('should return UserModel when the call to client is successful', () async {
    when(() => mockClient.get(endPoint: '/users?per_page=10&page=1'))
        .thenAnswer((_) async => tResponse);

    final result = await dataSource.getUser(page: 1, limit: 10);

    expect(result, isA<UserModel>());
    expect(result.data?.first.firstName, 'John');
  });

  test('should throw ServerException when there is a SocketException', () async {
    when(() => mockClient.get(endPoint: any(named: 'endPoint')))
        .thenThrow(SocketException('No Internet'));

    expect(() => dataSource.getUser(page: 1, limit: 10),
        throwsA(isA<ServerException>()));
  });

  test('should throw ServerException on generic exception', () async {
    when(() => mockClient.get(endPoint: any(named: 'endPoint')))
        .thenThrow(Exception('Unexpected error'));

    expect(() => dataSource.getUser(page: 1, limit: 10),
        throwsA(isA<ServerException>()));
  });
}
