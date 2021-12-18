import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  Timer? _timer;
  int _start = 5;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  @override
  CustomTimerState createState() => CustomTimerState();
}

class CustomTimerState extends State<CustomTimer> {
  CustomTimer t = CustomTimer();
  bool startQuiz = false;
  void startTimerUp() {
    const oneSec = Duration(seconds: 1);
    t._timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (t.seconds < 0) {
            timer.cancel();
          } else {
            t.seconds = t.seconds + 1;
            if (t.seconds > 59) {
              t.minutes += 1;
              t.seconds = 0;
              if (t.minutes > 59) {
                t.hours += 1;
                t.minutes = 0;
              }
            }
          }
        },
      ),
    );
  }

  void startTimerDown() {
    const oneSec = Duration(seconds: 1);
    t._timer = Timer.periodic(oneSec, (Timer timer) {
      if (t._start == 0) {
        setState(() {
          timer.cancel();
          startTimerUp();
          startQuiz = true;
        });
      } else {
        setState(() {
          t._start--;
        });
      }
    });
  }

  @override
  void dispose() {
    t._timer?.cancel();
    super.dispose();
  }

  // Starts the timer upon loading homepage
  @override
  void initState() {
    super.initState();
    startTimerDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: startQuiz
          ? Text(
              '${t.hours}h:${t.minutes}m:${t.seconds}s',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            )
          : Text(
              '${t._start}s',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
    );
  }
}
