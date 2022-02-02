import 'package:flutter/material.dart';
import 'package:test_application_v1/data/question_database_handler.dart';
import '/screens/splash_screen.dart';

bool isLoading = false;

void main() async {
  runApp(const MyApp());
  final QuestionDatabaseHelper _questionDatabaseHelper =
      QuestionDatabaseHelper();
  await _questionDatabaseHelper.insertDataOnStart();
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
