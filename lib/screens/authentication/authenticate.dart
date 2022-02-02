import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Authentication Page"),
              TextField(),
              TextField(),
              SizedBox(height: 20),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.6,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
