import 'package:flutter/material.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';

class FoodDetailsCloseIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ModalDialog.closeDialog(context),
      child: Container(
        margin: EdgeInsets.only(top: 30, right: 30),
        child: Icon(Icons.close, size: 24),
      ),
    );
  }
}
