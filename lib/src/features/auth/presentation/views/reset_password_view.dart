import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';

import '../components/k_password_field.dart';
import '../components/top_screen_text.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TopScreenText(titleText: "Reset Password", helperText: ""),
                SizedBox(height: context.height * 0.15),
                KPasswordField(
                  controller: _newPasswordController,
                  hint: "*******",
                  label: "New Password",
                ),
                SizedBox(height: 15),
                KPasswordField(
                  controller: _newPasswordController,
                  hint: "*******",
                  label: "Confirm Password",
                ),

                SizedBox(height: context.height * 0.09),
                KElevatedButton(onPressed: () {
                  while(context.canPop()) {
                    context.pop();
                  }

                }, buttonTitle: "Reset Password"),
                SizedBox(height: context.height * 0.31),
                KRichText(leadingText: "Powered By", trailingText: "M360 ICT"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
