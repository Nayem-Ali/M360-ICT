
import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/app/app.dart';
import 'package:m360_ict/src/core/dependency_injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const App());
}
