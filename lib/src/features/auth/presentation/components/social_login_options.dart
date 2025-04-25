import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: CircleBorder(),
          child: IconButton(onPressed: () {}, icon: Image.asset(IconsPath.googleIcon)),
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
  }
}
