import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_application_v1/customs/custom_timer.dart';
import 'package:test_application_v1/test_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _startQuiz = false;

  int _start = 5;
  Timer? _timer;

  void startTimerDown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _startQuiz = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    startTimerDown();
  }

  final appBar = AppBar(
    title: const Text('Test Application'),
    elevation: 6,
  );

  void _onWillPop(BuildContext context) {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context) as Future<bool>,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('assets/images/splashscreen.png').image,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: _startQuiz
                    ? const Text(
                        'Time Elasped: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    : const Text(
                        'You May Start the test in: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: CustomTimer(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(130, 50),
                  primary: Colors.green,
                ),
                onPressed: _startQuiz
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage()),
                        );
                      }
                    : null,
                child: const Text('START'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
