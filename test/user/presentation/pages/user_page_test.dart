import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_list_app/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_user_list_app/features/user/presentation/pages/user_page.dart';

// Step 1: Create a mock UserBloc
class MockUserBloc extends Mock implements UserBloc {}

class FakeUserEvent extends Fake implements UserEvent {}
class FakeUserState extends Fake implements UserState {}

void main() {
  late MockUserBloc mockUserBloc;

  setUpAll(() {
    registerFallbackValue(FakeUserEvent());
    registerFallbackValue(FakeUserState());
  });

  setUp(() {
    mockUserBloc = MockUserBloc();
  });

  testWidgets('displays CircularProgressIndicator while loading', (WidgetTester tester) async {
    // Step 2: Stub the bloc
    when(() => mockUserBloc.state).thenReturn(UserLoadingState());
    when(() => mockUserBloc.stream).thenAnswer((_) => Stream<UserState>.value(UserLoadingState()));

    // Step 3: Pump widget inside BlocProvider
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<UserBloc>.value(
          value: mockUserBloc,
          child: const UserPage(),
        ),
      ),
    );

    // Step 4: Test expectation
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
