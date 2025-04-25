import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m360_ict/src/core/dependency_injection/dependency_injection.dart';
import 'package:m360_ict/src/core/router/router.dart';
import 'package:m360_ict/src/core/styles/theme/app_theme.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl.get<AuthBloc>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
