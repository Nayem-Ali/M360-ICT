import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/constants/images_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/place_bloc.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/place_state.dart';
import 'package:m360_ict/src/features/home/presentation/components/place_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: context.height * 0.26,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(50),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(flex: 2),
                          Text(
                            "Good Morning",
                            style: context.titleMedium?.copyWith(fontFamily: AppFonts.poppins),
                          ),
                          Text(
                            "Ahmed Ariyan",
                            style: context.headlineMedium?.copyWith(fontFamily: AppFonts.poppins),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              style: context.titleSmall?.copyWith(fontFamily: AppFonts.poppins),
                              children: [
                                TextSpan(text: "You are in a "),
                                TextSpan(
                                  text: "healthy ",
                                  style: context.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                                TextSpan(text: "environment"),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Image(image: AssetImage(ImagesPath.dp)),
                  ],
                ),
              ),
              Image.asset(ImagesPath.shape, height: context.height * 0.26, fit: BoxFit.cover),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 32),
            child: Text(
              "My Places",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontFamily: AppFonts.poppins),
            ),
          ),
          PlaceCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteName.addPlace);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
