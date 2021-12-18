import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_application_v1/customs/custom_card.dart';

import 'customs/custom_card.dart';
import 'customs/custom_modal.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CarouselController c = CustomCardState().carouselController;

  @override
  Widget build(BuildContext context) {
    double _sliderValue = 0;
    final appBar = AppBar(
      title: const Text('Test Page'),
      leading: null,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30),
          child: IconButton(
            onPressed: () => CustomModal(c).showQuestionMenu(context),
            icon: const Icon(Icons.book_rounded),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // user details
            Container(
              height: 70,
              color: Colors.indigo.shade800,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        child: const Text('AH'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '5th',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Your Rank',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Slider(
                        value: _sliderValue,
                        max: 5,
                        divisions: 5,
                        label: 'You\'ve passed ${_sliderValue.toInt()} contestants',
                        onChanged: (double value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Swipable questions card
            Container(
              height: MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top - 70,
              child: CustomCard(),
            ),
            // navigation and indicator
          ],
        ),
      ),
    );
  }
}
