import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_application_v1/customs/custom_card.dart';
import 'package:test_application_v1/data/questions.dart';

// Bottom sheet that displays all the questions.
// Tapping on the question number will take user to the particular question
class CustomModal extends StatelessWidget {
  Questions q = Questions();
  late int length = q.questions.length;
  CustomCard card = CustomCard();
  CustomCardState c = CustomCardState();

  void initState() {}

  CarouselController controller;
  int currentCard = 0;
  CustomModal(this.controller);

  // THis function shows the BottomModalSheet
  void showQuestionMenu(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: CustomModal(controller),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 300,
          child: GridView.count(
            crossAxisCount: 6,
            children: List<Widget>.generate(length, (index) {
              return Container(
                margin: const EdgeInsets.all(10),
                color: q.questions[index]['color'],
                child: TextButton(
                  onPressed: () {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    currentCard = index;
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
