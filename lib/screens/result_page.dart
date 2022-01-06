import 'package:flutter/material.dart';
import './home_page.dart';

// Result page to show the result table
// Temporarily shows dummy table as results
class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<bool> _onWillPop() async {
    Navigator.pop(context);
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // To display column names common for all results
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 2,
                ),
                children: const [
                  TableRow(children: [
                    Padding(padding: EdgeInsets.all(5), child: Text('Question')),
                    Padding(padding: EdgeInsets.all(5), child: Text('Status')),
                    Padding(padding: EdgeInsets.all(5), child: Text('Correct/Incorrect')),
                    Padding(padding: EdgeInsets.all(5), child: Text('Time spent')),
                    Padding(padding: EdgeInsets.all(5), child: Text('Marks')),
                  ]),
                ],
              ),
              // this table will build dynamic table based on result
              Table(
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(children: [
                    Text('1'),
                    Text('Attempted'),
                    Text('Correct'),
                    Text('35'),
                    Text('120'),
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
