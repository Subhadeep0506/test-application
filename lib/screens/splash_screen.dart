import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: Image.asset('assets/images/splashscreen.png').image,
      seconds: 5,
      title: const Text(
        'Test Application',
        style: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontFamily: 'Satisfy',
        ),
      ),
      loadingText: const Text(
        'Loading...',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      loaderColor: Colors.white,
      navigateAfterSeconds: HomePage(), //TODO: Add homepage,
    );
  }
}
