import 'package:flutter/material.dart';

class ModalDialog {
  static void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<dynamic> showDialogWidget(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SafeArea(child: child),
    );
  }
}
