import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/features/auth/domain/dto/auth_dto.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:m360_ict/src/features/auth/presentation/components/k_text_field.dart';

import '../components/k_password_field.dart';
import '../components/social_login_options.dart';
import '../components/top_screen_text.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> checkRemember = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (ctx, state) {
          if (state is AuthLoading) {
            BotToast.showLoading();
          } else if (state is AuthFailure) {
            BotToast.showText(text: "Something went wrong");
            BotToast.closeAllLoading();
          } else if (state is AuthSuccess) {
            BotToast.showText(text: "Sign Up Successful");
            BotToast.closeAllLoading();
          }
        },
        builder: (ctx, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopScreenText(
                      titleText: "Sign In",
                      helperText: "Let's save environment together",
                    ),
                    SizedBox(height: context.height * 0.13),
                    KTextField(
                      controller: _emailController,
                      hint: "use@example.com",
                      label: "Email",
                    ),
                    KPasswordField(
                      controller: _passwordController,
                      hint: "********",
                      label: "Password",
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: checkRemember,
                          builder:
                              (context, value, child) => Checkbox(
                                value: checkRemember.value,
                                onChanged: (val) {
                                  checkRemember.value = !checkRemember.value;
                                },
                              ),
                        ),
                        Text("Remember Me"),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(RouteName.sendOtp);
                          },
                          child: Text(
                            "Forgotten Password",
                            style: context.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    KElevatedButton(
                      onPressed: () {
                        ctx.read<AuthBloc>().add(
                          SignInEvent(
                            authDto: AuthDto(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          ),
                        );
                      },
                      buttonTitle: "Sign In",
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Text("Or Sign In With", style: context.titleSmall),
                    ),
                    SocialLoginOptions(),
                    SizedBox(height: context.height * 0.13),
                    InkWell(
                      onTap: () => context.pushNamed(RouteName.signUp),
                      child: KRichText(
                        leadingText: "Didn't have an account?",
                        trailingText: "Sign Up",
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    KRichText(leadingText: "Powered By", trailingText: "M360 ICT"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
