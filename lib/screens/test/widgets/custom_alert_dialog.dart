import 'package:flutter/material.dart';
import '../../result/result_page.dart';

class ShowAlertDialog {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Submit"),
      onPressed: () async {
        Navigator.of(context).pop(true);

        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage()),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Would you like to submit now?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
