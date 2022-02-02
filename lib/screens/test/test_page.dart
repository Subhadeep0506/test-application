import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:test_application_v1/data/question_database_handler.dart';
import '/screens/test/widgets/custom_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/custom_card.dart';

// The page that is shown when the user starts the exam
class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  CarouselController c = CarouselController();
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    widget.c = CustomCardState().carouselController;
  }

  late Future<SharedPreferences> prefs;
  @override
  Widget build(BuildContext context) {
    double _sliderValue = 0;
    final appBar = AppBar(
      title: const Text('Test Page'),
      leading: null,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30),
          // Temporarily disabling navigation grid
          // child: IconButton(
          //   onPressed: () => CustomModal(widget.c).showQuestionMenu(context),
          //   icon: const Icon(Icons.book_rounded),
          // ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top,
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
                          'Name',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Roll no.',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 10,
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(""),
                        ),
                      )),
                ],
              ),
            ),
            // Swipable questions card
            Container(
              height: MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  70,
              child: CustomCard(),
            ),
            // navigation and indicator
          ],
        ),
      ),
    );
  }
}
