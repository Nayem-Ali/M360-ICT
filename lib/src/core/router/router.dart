import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/dependency_injection/dependency_injection.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:m360_ict/src/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:m360_ict/src/features/auth/presentation/views/reset_password_view.dart';
import 'package:m360_ict/src/features/auth/presentation/views/send_otp_view.dart';
import 'package:m360_ict/src/features/auth/presentation/views/sign_in_view.dart';
import 'package:m360_ict/src/features/auth/presentation/views/sign_up_view.dart';
import 'package:m360_ict/src/features/auth/presentation/views/verify_otp_view.dart';
import 'package:m360_ict/src/shared/presentation//splash_view.dart';

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
    GoRoute(
      path: "/sign-in",
      name: RouteName.signIn,
      builder: (context, state) {
        return SignInView();
      },
    ),
    GoRoute(
      path: "/send-otp",
      name: RouteName.sendOtp,
      builder: (context, state) {
        return SendOtpView();
      },
    ),
    GoRoute(
      path: "/verify-otp",
      name: RouteName.verifyOtp,
      builder: (context, state) {
        return VerifyOtpView();
      },
    ),
    GoRoute(
      path: "/reset-password",
      name: RouteName.resetPassword,
      builder: (context, state) {
        return ResetPasswordView();
      },
    ),
    GoRoute(
      path: "/sign-up",
      name: RouteName.signUp,
      builder: (context, state) {
        return SignUpView();
      },
    ),
  ],
);
