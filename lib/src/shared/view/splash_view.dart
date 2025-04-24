import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/images_path.dart';
import 'package:m360_ict/src/core/widgets/bottom_text.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImagesPath.appIcon),
            const Spacer(),
            const BottomText(),
          ],
        ),
      ),
    );
  }
}
