import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/login_registration.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Colors.lightBlue,
        ),
      ),
      home: LoginPage(),
      );
  }
}
