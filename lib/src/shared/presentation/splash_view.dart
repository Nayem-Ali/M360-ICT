import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/database/remote/firebase_handler.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/images_path.dart';
import 'package:m360_ict/src/core/widgets/k_rich_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      User? user = FirebaseHandler.firebaseAuth.currentUser;
      if (user != null) {
        context.goNamed(RouteName.home);
      } else{
        context.goNamed(RouteName.signIn);

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImagesPath.appIcon),
            const Spacer(),
            const KRichText(leadingText: "Powered By", trailingText: "M360 ICT"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
