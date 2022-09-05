import 'package:flutter/material.dart';

class CustomWidgets {
  static basicShowDialog(BuildContext context, String title, String content,
      Function() voidCallback) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: voidCallback,
                child: const Text("Proses"),
              )
            ],
          );
        });
  }

  static showDialogOK(BuildContext context, String title, String content,
      Function()? voidCallback) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              ElevatedButton(onPressed: voidCallback, child: const Text("OK"))
            ],
          );
        });
  }
}
