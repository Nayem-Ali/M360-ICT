import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/features/home/presentation/components/info_tile.dart';

class AddPlaceView extends StatefulWidget {
  const AddPlaceView({super.key});

  @override
  State<AddPlaceView> createState() => _AddPlaceViewState();
}

class _AddPlaceViewState extends State<AddPlaceView> {
  final TextEditingController _placeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              context.goNamed(RouteName.signIn);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(image: AssetImage(IconsPath.placeIcon)),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: _placeNameController,
                      textAlign: TextAlign.center,
                      style: context.titleLarge,
                    ),
                  ),
                ],
              ),
              Spacer(),

              InfoTile(),
              // Column(
              //   children: [
              //     InfoTile(title: "Total Number of People", number: 52),
              //     InfoTile(title: "Total Number of Rooms", number: 7),
              //     InfoTile(title: "Total area (sq)", number: 3700),
              //     InfoTile(title: "Total AC", number: 2),
              //     InfoTile(title: "Total Refrigerators", number: 2),
              //     InfoTile(title: "Total Computers", number: 60),
              //     InfoTile(title: "Total Indoor Plants", number: 23),
              //     InfoTile(title: "Total Kitchen Burner", number: 2),
              //   ],
              // ),
              Spacer(),
              KElevatedButton(
                onPressed: () {
                  context.pushNamed(RouteName.calculateEmission);
                },
                buttonTitle: "Calculate Carbon Emission",
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
