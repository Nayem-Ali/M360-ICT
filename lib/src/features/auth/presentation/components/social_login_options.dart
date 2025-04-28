import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_state.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLoading){
          BotToast.showLoading();
        }
        else if(state is AuthSuccess){
          BotToast.closeAllLoading();
          context.goNamed(RouteName.home);
        } else if(state is AuthFailure) {
          BotToast.closeAllLoading();
          BotToast.showText(text: "Something went wrong");
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: CircleBorder(),
              child: IconButton(onPressed: () {
                 context.read<AuthBloc>().add(GoogleSignInEvent());
              }, icon: Image.asset(IconsPath.googleIcon)),
            ),
            SizedBox(width: 18),
            Card(
              shape: CircleBorder(),
              child: IconButton(onPressed: () {}, icon: Image.asset(IconsPath.facebookIcon)),
            ),
            SizedBox(width: 18),
            Card(
              shape: CircleBorder(),
              child: IconButton(onPressed: () {}, icon: Image.asset(IconsPath.microsoftIcon)),
            ),
            SizedBox(width: 18),
            Card(
              shape: CircleBorder(),
              child: IconButton(onPressed: () {}, icon: Image.asset(IconsPath.appleIcon)),
            ),
          ],
        );
      },

    );
  }
}
