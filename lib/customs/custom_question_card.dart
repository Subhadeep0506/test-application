import 'package:flutter/material.dart';

import 'custom_list_tile.dart';

class QuestionCard extends StatefulWidget {
  final Color color;
  String _question = '';
  int _id;
  List<Object> _options;

  QuestionCard(this.color, this._question, this._id, this._options);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int _value = 0;
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: widget.color,
      ),
      margin: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      height: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    'Question: ${widget._id}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    widget._question,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white.withOpacity(0.3),
              ),
              margin: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: CustomListTile(widget._id - 1),
            ),
          ],
        ),
      ),
    );
  }
}
