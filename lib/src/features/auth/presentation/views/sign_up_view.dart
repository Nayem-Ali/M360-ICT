import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/country_code.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';
import 'package:m360_ict/src/features/auth/domain/dto/auth_dto.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:m360_ict/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:m360_ict/src/features/auth/presentation/components/k_text_field.dart';

import '../components/k_password_field.dart';
import '../components/social_login_options.dart';
import '../components/top_screen_text.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  ValueNotifier<String> _selectedCountryCode = ValueNotifier(
    "${CountryCode.countries.first.flag} ${CountryCode.countries.first.phoneCode}",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            BotToast.showLoading();
          }
          else if (state is AuthFailure) {
            BotToast.showText(text: "Something went wrong");
            BotToast.closeAllLoading();
          }
          else if (state is AuthSuccess) {
            BotToast.showText(text: "Login Successful");
            BotToast.closeAllLoading();
          }
        },
        builder: (context, state) {

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopScreenText(
                      titleText: "Sign Up",
                      helperText: "Let's save environment together",
                    ),
                    SizedBox(height: context.height * 0.03),
                    KTextField(
                      controller: _nameController,
                      hint: "e.g. Ahmed Ariyan",
                      label: "Name",
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number"),
                        ValueListenableBuilder(
                          valueListenable: _selectedCountryCode,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _contactController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: DropdownButton(
                                    style: context.labelLarge,
                                    value: _selectedCountryCode.value,
                                    items:
                                        CountryCode.countries
                                            .map(
                                              (country) => DropdownMenuItem(
                                                value: "${country.flag} ${country.phoneCode}",
                                                child: Text(
                                                  "${country.flag} ${country.phoneCode}",
                                                ),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (val) {
                                      _selectedCountryCode.value = val!;
                                    },
                                  ),
                                ),
                                hintText: "17XXXXXXX",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
                    KPasswordField(
                      controller: _confirmPasswordController,
                      hint: "********",
                      label: "Confirm Password",
                    ),
                    SizedBox(height: context.height * 0.03),

                    KElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          SignUpEvent(
                            authDto: AuthDto(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          ),
                        );
                      },
                      buttonTitle: "Sign Up",
                    ),

                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Or Sign In With",
                        style: context.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.shadow.withValues(alpha: 90),
                        ),
                      ),
                    ),
                    SocialLoginOptions(),
                    InkWell(
                      onTap: () => context.pop(),
                      child: KRichText(
                        leadingText: "Already have an account?",
                        trailingText: "Sign In",
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
