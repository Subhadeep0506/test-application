import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_application_v1/data/questions.dart';

import 'custom_list_tile.dart';
import 'custom_modal.dart';

class CustomPage extends StatefulWidget {
  CustomPage({Key? key}) : super(key: key);
  int currentCard = 0;
  final PageController carouselController = PageController();
  @override
  CustomCardState createState() => CustomCardState();
}

typedef PageNumberCallBack = void Function(int index);

class CustomCardState extends State<CustomPage> {
  late final PageNumberCallBack pageNumberCallBack;
  var q = Questions();
  int _currCard = 0;
  List<QuestionCard> cards = [];
  List slectedOptions = [0, 0, 0, 0];
  final PageController pageController = CustomPage().carouselController;
  @override
  void initState() {
    super.initState();
    cards = [
      QuestionCard(q.questions[0]['color'], q.questions[0]['question'], q.questions[0]['id'], q.questions[0]['options'], slectedOptions[0] = 0),
      QuestionCard(q.questions[1]['color'], q.questions[1]['question'], q.questions[1]['id'], q.questions[1]['options'], slectedOptions[1] = 0),
      QuestionCard(q.questions[2]['color'], q.questions[2]['question'], q.questions[2]['id'], q.questions[2]['options'], slectedOptions[2] = 0),
      QuestionCard(q.questions[3]['color'], q.questions[3]['question'], q.questions[3]['id'], q.questions[3]['options'], slectedOptions[3] = 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: MediaQuery.of(context).size.width * 1,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageView(
            controller: pageController,
            children: cards.toList(),
          ),
          Container(
            height: 70,
            color: Colors.indigo,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: ElevatedButton(
                      onPressed: _currCard == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              setState(() {
                                if (_currCard > 0) {
                                  _currCard--;
                                }
                              });
                            },
                      child: const Text('PREVIOUS'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 50),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, left: 5),
                    child: ElevatedButton(
                      onPressed: _currCard == cards.length - 1
                          ? null
                          : () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              setState(() {
                                if (_currCard < cards.length) {
                                  _currCard++;
                                }
                              });
                            },
                      child: const Text('NEXT'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 50),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                    right: 20,
                  ),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45 / 2.0),
                    color: cards[_currCard].color,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final Color color;
  String _question = '';
  int _id;
  List<Object> _options;
  int selectedOption;
  QuestionCard(this.color, this._question, this._id, this._options, this.selectedOption);

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
      // height: double.infinity,
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
                    color: Colors.grey.shade200,
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
                color: Colors.grey.shade700,
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
