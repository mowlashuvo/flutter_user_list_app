import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user_details_cubit.dart';
import '../widget/user_view.dart';

class UserDetailPage extends StatelessWidget {
  final String id;

  const UserDetailPage({super.key, required this.id});

  static const String route = '/user-details';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailCubit, UserDataEntity>(
      builder: (context, user) {
        return Scaffold(
          appBar: AppBar(title: Text('${user.firstName!} ${user.lastName!}')),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                ),
                const SizedBox(height: 20),
                Text('${user.firstName!} ${user.lastName!}',
                    style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 10),
                Text(user.email ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }
}