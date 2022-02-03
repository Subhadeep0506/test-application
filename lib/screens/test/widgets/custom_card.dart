import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_application_v1/data/question_database_handler.dart';
import '/screens/test/widgets/custom_alert_dialog.dart';
import '/data/questions.dart';

import 'custom_modal.dart';
import 'custom_question_card.dart';

// This Widget contains the CarouselSlider and the navigator to navigate accross questions
class CustomCard extends StatefulWidget {
  CustomCard({Key? key}) : super(key: key);

  int currentCard = 0;
  final CarouselController carouselController = CarouselController();

  @override
  CustomCardState createState() => CustomCardState();
}

typedef PageNumberCallBack = void Function(int index);

class CustomCardState extends State<CustomCard> {
  // Temporarily using dummy list data to show questions and options
  late List<Map> _questions;
  late List<Object> _options;
  List<QuestionCard> cards = [];
  int currCard = 0;

  CarouselController carouselController = CustomCard().carouselController;

  @override
  void initState() {
    super.initState();
    initializeVariables();
    cards = [];
  }

  Future<void> initializeVariables() async {
    _questions = await QuestionDatabaseHelper().getAllTables();

    _options = [
      _questions[currCard]['option1'],
      _questions[currCard]['option2'],
      _questions[currCard]['option3'],
      _questions[currCard]['option4'],
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
          // swipeable question cards
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currCard = index;
                });
              },
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlay: false,
              height: MediaQuery.of(context).size.height * 0.685,
              enlargeCenterPage: true,
            ),
            items: cards.toList(),
          ),
          Container(
            height: 70,
            color: Colors.indigo,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: ElevatedButton(
                      // if on the first question, disable the PREVIOUS button
                      onPressed: currCard == 0
                          ? null
                          : () {
                              carouselController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              setState(() {
                                if (currCard > 0) {
                                  currCard--;
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
                      // if reached last question, show SUBMIT button
                      // else show the NEXT button
                      onPressed: currCard == cards.length - 1
                          ? () {
                              ShowAlertDialog().showAlertDialog(context);
                            }
                          : () {
                              carouselController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              setState(() {
                                if (currCard < cards.length) {
                                  currCard++;
                                }
                              });
                            },
                      child: currCard == cards.length - 1
                          ? const Text('SUBMIT')
                          : const Text('NEXT'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 50),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => CustomModal(carouselController)
                        .showQuestionMenu(context),
                    icon: const Icon(
                      Icons.book_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45 / 2.0),
                    color: Colors.green,
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
