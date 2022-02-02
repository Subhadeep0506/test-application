// This file checks whether user is signed in or not.
// if not signed in, user will be taken to authentication page.
// Else will be taken to homepage

import 'package:flutter/material.dart';
import 'package:test_application_v1/screens/home/home_page.dart';
import '/screens/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Authenticate();
    return HomePage();
  }
}
