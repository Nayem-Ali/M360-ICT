import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/shared/view/splash_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      name: RouteName.splash,
      builder: (context, state) {
        return SplashView();
      },
    ),
  ],
);
