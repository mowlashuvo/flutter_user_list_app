import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../bloc/user/user_bloc.dart';
import '../bloc/user_details_cubit.dart';
import '../widget/user_view.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  static const String route = '/user';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ScrollController _controller = ScrollController();
  Timer? _scrollDebounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(UserLoadEvent());
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 300) {
        final bloc = context.read<UserBloc>();
        final state = context.read<UserBloc>().state;
        if (state is UserSuccessState &&
            !state.hasReachedMax &&
            !state.isLoadingMore) {
          if (_scrollDebounce?.isActive ?? false) return;
          _scrollDebounce = Timer(const Duration(milliseconds: 400), () {
            bloc.add(UserLoadEvent());
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Users")),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Theme.of(context).primaryColor,
              ));
            } else if (state is UserSuccessState) {
              final users = state.data;
              final isLoadingMore = state.isLoadingMore;
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search by name...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context
                            .read<UserBloc>()
                            .add(UserSearchEvent(query: value));
                      },
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<UserBloc>().add(UserRefreshEvent());
                      },
                      child: ListView.builder(
                        controller: _controller,
                        itemCount: users.length + (isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == users.length) {
                            return Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                          }
                          final user = users[index];
                          return UserTile(
                            user: user,
                            onTap: () {
                              context.read<UserDetailCubit>().user(user);
                              // context.push('${UserPage.route}/${user.id}');
                              context.push('${UserPage.route}/${user.id}');
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is UserErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(UserLoadEvent());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _scrollDebounce?.cancel();
  }
}
