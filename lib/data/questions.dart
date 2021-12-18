import 'package:flutter/material.dart';

class Questions {
  List questions = [
    {
      'id': 1,
      'question': 'Capital of Australia?',
      'options': [
        {'text': 'Toronto'},
        {'text': 'Delhi'},
        {'text': 'Sydney'},
        {'text': 'Hong Kong'},
      ],
      'color': Colors.green.shade200,
    },
    {
      'id': 2,
      'question': 'Capital of India?',
      'options': [
        {'text': 'Toronto'},
        {'text': 'Sydney'},
        {'text': 'Hong Kong'},
        {'text': 'Delhi'},
      ],
      'color': Colors.amber.shade200,
    },
    {
      'id': 3,
      'question': 'Capital of Canada?',
      'options': [
        {'text': 'Toronto'},
        {'text': 'Hong Kong'},
        {'text': 'Sydney'},
        {'text': 'Delhi'},
      ],
      'color': Colors.blue.shade200,
    },
    {
      'id': 4,
      'question': 'Capital of China?',
      'options': [
        {'text': 'Sydney'},
        {'text': 'Delhi'},
        {'text': 'Toronto'},
        {'text': 'Hong Kong'},
      ],
      'color': Colors.pink.shade200,
    },
  ];
}
