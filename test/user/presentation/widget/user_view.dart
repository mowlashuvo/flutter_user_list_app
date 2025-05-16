import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_user_list_app/features/user/domain/entities/user_entity.dart';
import 'package:flutter_user_list_app/features/user/presentation/widget/user_view.dart';

void main() {
  testWidgets('UserTile displays user info and reacts to tap', (WidgetTester tester) async {
    final user = UserDataEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      avatar: 'https://example.com/avatar.png',
    );

    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UserTile(
            user: user,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);

    await tester.tap(find.byType(UserTile));
    expect(tapped, true);
  });
}
