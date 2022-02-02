import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_application_v1/customs/times.dart';

class CustomTimer extends StatefulWidget {
  Timer? _timer;
  Times t = Times();

  @override
  CustomTimerState createState() => CustomTimerState();
}

class CustomTimerState extends State<CustomTimer> {
  // CustomTimer t = CustomTimer();
  bool startQuiz = false;

  void startTimerUp() {
    const oneSec = Duration(seconds: 1);
    widget._timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (widget.t.getSeconds() < 0) {
            timer.cancel();
          } else {
            widget.t.setSeconds(widget.t.getSeconds() + 1);

            if (widget.t.getSeconds() > 59) {
              widget.t.setMinutes(widget.t.getMinutes() + 1);
              widget.t.setSeconds(0);
              if (widget.t.getMinutes() > 59) {
                widget.t.setHours(widget.t.getHours() + 1);
                widget.t.setMinutes(0);
              }
            }
          }
        },
      ),
    );
  }

  void startTimerDown() {
    const oneSec = Duration(seconds: 1);
    widget._timer = Timer.periodic(oneSec, (Timer timer) {
      if (widget.t.start == 0) {
        setState(() {
          timer.cancel();
          startTimerUp();
          startQuiz = true;
        });
      } else {
        setState(() {
          widget.t.start--;
        });
      }
    });
  }

  @override
  void dispose() {
    widget._timer?.cancel();
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
      child: Text("${widget.t.getSeconds()}"),
    );
  }
}
