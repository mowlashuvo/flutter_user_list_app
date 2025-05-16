import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/theme.dart';
import '../injection_container.dart';
import 'user/presentation/bloc/user/user_bloc.dart';
import 'user/presentation/bloc/user_details_cubit.dart';
import 'user/presentation/pages/user_detail_page.dart';
import 'user/presentation/pages/user_page.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => UserDetailCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        child: MaterialApp.router(
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: MaterialTheme.lightTheme(),
          darkTheme: MaterialTheme.darkTheme(),
          themeMode: ThemeMode.system,
          title: 'User List App',
        ),
      ),
    );
  }

  final router = GoRouter(
    initialLocation: UserPage.route,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: UserPage.route,
        pageBuilder: (context, state) => const MaterialPage(child: UserPage()),
      ),
      GoRoute(
        path: '${UserPage.route}/:id',
        name: UserDetailPage.route,
        pageBuilder: (context, state) {
          final userId = state.pathParameters['id']!;
          return MaterialPage(child: UserDetailPage(id: userId));
        },
      ),
    ],
  );
}
