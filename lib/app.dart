import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';
import 'package:flutter_first_project/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: HomeScreen());
  }
}
