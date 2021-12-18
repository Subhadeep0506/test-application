import 'package:flutter/material.dart';
import 'package:test_application_v1/data/questions.dart';

// List to display options for the question
class CustomListTile extends StatefulWidget {
  @override
  int i;

  CustomListTile(this.i);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  int _value = 0;
  int groupValue = 0;
  Questions q = Questions();
  late List options;

  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.i;
    options = q.questions[id]['options'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
            value: 0,
            groupValue: groupValue,
            onChanged: (int? val) {
              setState(() {
                groupValue = val!;
              });
            },
          ),
          title: Text(options[0]['text']),
        ),
        ListTile(
          leading: Radio(
            value: 1,
            groupValue: groupValue,
            onChanged: (int? val) {
              setState(() {
                groupValue = val!;
              });
            },
          ),
          title: Text(options[1]['text']),
        ),
        ListTile(
          leading: Radio(
            value: 2,
            groupValue: groupValue,
            onChanged: (int? val) {
              setState(() {
                groupValue = val!;
              });
            },
          ),
          title: Text(options[2]['text']),
        ),
        ListTile(
          leading: Radio(
            value: 3,
            groupValue: groupValue,
            onChanged: (int? val) {
              setState(() {
                groupValue = val!;
              });
            },
          ),
          title: Text(options[3]['text']),
        ),
      ],
    );
  }
}
