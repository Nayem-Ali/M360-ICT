import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/router/router.dart';
import 'package:m360_ict/src/core/styles/theme/app_theme.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: AppTheme.lightTheme,
    );
  }
}
