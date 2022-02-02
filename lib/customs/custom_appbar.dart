import 'package:flutter/material.dart';
import 'package:test_application_v1/customs/custom_timer.dart';
import 'package:test_application_v1/customs/times.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  Times t = Times();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('${t.hours}h:${t.minutes}m:${t.seconds}s'),
      leading: null,
    );
  }
}
