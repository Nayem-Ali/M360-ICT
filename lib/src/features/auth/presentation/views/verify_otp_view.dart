import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart' show KElevatedButton;
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../components/top_screen_text.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
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
                  titleText: "Verify OTP",
                  helperText: "Recover your account in easy steps",
                ),
                SizedBox(height: context.height * 0.075),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "An email has been sent to ",
                          style: context.titleSmall
                        ),
                        TextSpan(
                          text: "use@example.com",
                          style: context.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.shadow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Please enter the OTP",
                    style: context.titleSmall
                  ),
                ),
                OTPTextField(
                  length: 4,
                  width: context.width,
                  fieldWidth: context.width / 8,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {},
                ),
                SizedBox(height: context.height * 0.15),
                KElevatedButton(
                  onPressed: () => context.pushNamed(RouteName.resetPassword),
                  buttonTitle: "Verify OTP",
                ),
                SizedBox(height: context.height * 0.03),

                InkWell(
                  onTap: () => context.pop(),
                  child: KRichText(leadingText: "Didn't receive a code?", trailingText: "Resend"),
                ),
                SizedBox(height: context.height * 0.3),
                KRichText(leadingText: "Powered By", trailingText: "M360 ICT"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
