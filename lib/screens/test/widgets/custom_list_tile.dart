import 'package:flutter/material.dart';
import 'package:test_application_v1/data/question_database_handler.dart';

// List to display options for the question
class CustomListTile extends StatefulWidget {
  int i;

  CustomListTile(this.i);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  int _selectedValue = 0;
  late int id;
  int groupValue = 0;
  late Map _questions;
  late List options;

  @override
  void initState() {
    id = widget.i;
    initializeVariables();
    super.initState();
  }

  Future<void> initializeVariables() async {
    _questions = await QuestionDatabaseHelper().getQuestionById(id);

    _selectedValue = _questions['selected'];
    options = [
      _questions['option1'],
      _questions['option2'],
      _questions['option3'],
      _questions['option4'],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
            value: 0,
            groupValue: _selectedValue,
            onChanged: (int? val) {
              setState(() {
                _selectedValue = val!;
              });
            },
          ),
          title: Text(options[0]),
        ),
        ListTile(
          leading: Radio(
            value: 1,
            groupValue: _selectedValue,
            onChanged: (int? val) {
              setState(() {
                _selectedValue = val!;
              });
            },
          ),
          title: Text(options[1]),
        ),
        ListTile(
          leading: Radio(
            value: 2,
            groupValue: _selectedValue,
            onChanged: (int? val) {
              setState(() {
                _selectedValue = val!;
              });
            },
          ),
          title: Text(options[2]),
        ),
        ListTile(
          leading: Radio(
            value: 3,
            groupValue: _selectedValue,
            onChanged: (int? val) {
              setState(() {
                _selectedValue = val!;
              });
            },
          ),
          title: Text(options[3]),
        ),
      ],
    );
  }
}
