import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';
import 'package:m360_ict/src/features/auth/presentation/components/k_text_field.dart';
import '../components/top_screen_text.dart';

class SendOtpView extends StatefulWidget {
  const SendOtpView({super.key});

  @override
  State<SendOtpView> createState() => _SendOtpViewState();
}

class _SendOtpViewState extends State<SendOtpView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TopScreenText(
                  titleText: "Send OTP",
                  helperText: "Recover your account in easy steps",
                ),
                SizedBox(height: context.height * 0.14),
                KTextField(controller: _emailController, hint: "user@example.com", label: "Email"),
                SizedBox(height: context.height * 0.14),
                KElevatedButton(
                  onPressed: () {
                    context.pushNamed(RouteName.verifyOtp);
                  },
                  buttonTitle: "Send OTP",
                ),
                SizedBox(height: context.height * 0.37),
                KRichText(leadingText: "Powered By", trailingText: "M360 ICT"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
