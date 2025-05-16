import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_user_list_app/core/http_client/failure.dart';
import 'package:flutter_user_list_app/features/user/domain/entities/user_entity.dart';
import 'package:flutter_user_list_app/features/user/domain/usecases/user_usecase.dart';
import 'package:flutter_user_list_app/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dartz/dartz.dart';

// Mock classes
class MockUserUseCase extends Mock implements UserUseCase {}
class MockGetStorage extends Mock implements GetStorage {}

void main() {
  late UserBloc userBloc;
  late MockUserUseCase mockUserUseCase;
  late MockGetStorage mockGetStorage;

  final testUsers = [
    UserDataEntity(id: 1, firstName: 'John', lastName: 'Doe', email: 'john@example.com'),
    UserDataEntity(id: 2, firstName: 'Jane', lastName: 'Smith', email: 'jane@example.com'),
  ];

  final userEntityResponse = UserEntity(
    data: testUsers,
    totalPages: 3,
  );

  setUp(() {
    mockUserUseCase = MockUserUseCase();
    mockGetStorage = MockGetStorage();

    userBloc = UserBloc(useCase: mockUserUseCase, box: mockGetStorage);
  });

  group('UserBloc', () {
    test('initial state is UserLoadingState', () {
      expect(userBloc.state, const UserLoadingState());
    });

    blocTest<UserBloc, UserState>(
      'emits UserSuccessState with cached data when cache is valid',
      build: () {
        when(() => mockGetStorage.read(any())).thenAnswer((invocation) {
          final key = invocation.positionalArguments[0] as String;
          if (key.startsWith('user_list_page_1')) {
            return testUsers.map((e) => e.toJson()).toList();
          } else if (key.startsWith('user_list_page_timestamp1')) {
            // timestamp within cache validity (now - 1 hour)
            return DateTime.now().subtract(const Duration(hours: 1)).toIso8601String();
          }
          return null;
        });
        return userBloc;
      },
      act: (bloc) => bloc.add(UserLoadEvent()),
      expect: () => [
        UserSuccessState(data: testUsers, hasReachedMax: false, isLoadingMore: false),
      ],
      verify: (_) {
        verify(() => mockGetStorage.read('user_list_page_1')).called(1);
        verify(() => mockGetStorage.read('user_list_page_timestamp1')).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits UserSuccessState with API data when no valid cache',
      build: () {
        when(() => mockGetStorage.read(any())).thenReturn(null);
        when(() => mockUserUseCase.getUser(page: 1, limit: 10))
            .thenAnswer((_) async => Right(userEntityResponse));
        when(() => mockGetStorage.write(any(), any())).thenAnswer((_) async {});

        return userBloc;
      },
      act: (bloc) => bloc.add(UserLoadEvent()),
      expect: () => [
        UserSuccessState(data: testUsers, hasReachedMax: false, isLoadingMore: false),
      ],
      verify: (_) {
        verify(() => mockUserUseCase.getUser(page: 1, limit: 10)).called(1);
        verify(() => mockGetStorage.write('user_list_page_1', any())).called(1);
        verify(() => mockGetStorage.write('user_list_page_timestamp1', any())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits UserErrorState on failure from API',
      build: () {
        when(() => mockGetStorage.read(any())).thenReturn(null);
        when(() => mockUserUseCase.getUser(page: 1, limit: 10))
            .thenAnswer((_) async => Left(ConnectionFailure('Failed to load')));
        return userBloc;
      },
      act: (bloc) => bloc.add(UserLoadEvent()),
      expect: () => [
        const UserErrorState(error: 'Failed to load'),
      ],
    );

    blocTest<UserBloc, UserState>(
      'refresh clears cache and loads new data',
      build: () {
        when(() => mockGetStorage.remove(any())).thenAnswer((_) async {});
        when(() => mockUserUseCase.getUser(page: 1, limit: 10))
            .thenAnswer((_) async => Right(userEntityResponse));
        when(() => mockGetStorage.write(any(), any())).thenAnswer((_) async {});

        return userBloc;
      },
      act: (bloc) => bloc.add(const UserRefreshEvent(page: 1, limit: 10)),
      expect: () => [
        UserSuccessState(data: testUsers, hasReachedMax: false, isLoadingMore: false),
      ],
      verify: (_) {
        for (var i = 1; i <= 100; i++) {
          verify(() => mockGetStorage.remove('user_list_page_$i')).called(1);
          verify(() => mockGetStorage.remove('user_list_page_timestamp$i')).called(1);
        }
        verify(() => mockUserUseCase.getUser(page: 1, limit: 10)).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'search returns filtered users by first or last name',
      build: () {
        userBloc.userList.addAll(testUsers);
        return userBloc;
      },
      act: (bloc) => bloc.add(const UserSearchEvent(query: 'Jane')),
      expect: () => [
        UserSuccessState(data: [testUsers[1],], hasReachedMax: false, isLoadingMore: false),
      ],
    );

    blocTest<UserBloc, UserState>(
      'search with empty query returns full user list',
      build: () {
        userBloc.userList.addAll(testUsers);
        return userBloc;
      },
      act: (bloc) => bloc.add(const UserSearchEvent(query: '')),
      expect: () => [
        UserSuccessState(data: testUsers, hasReachedMax: false, isLoadingMore: false),
      ],
    );
  });
}
