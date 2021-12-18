import 'package:flutter/material.dart';
import 'package:test_application_v1/home_page.dart';

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
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: const [
              TableRow(children: [
                Text('Cell 1'),
                Text('Cell 2'),
                Text('Cell 3'),
              ]),
              TableRow(children: [
                Text('Cell 4'),
                Text('Cell 5'),
                Text('Cell 6'),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
