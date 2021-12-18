import 'package:flutter/material.dart';
import 'package:test_application_v1/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: true,
      title: 'Test Application',
    );
  }
}
