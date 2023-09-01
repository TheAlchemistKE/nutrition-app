import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class CustomToggleButton extends StatelessWidget {
  final bool active;
  final Function onTap;
  final String label;

  const CustomToggleButton(
      {Key? key, this.active = false, required this.onTap, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(active),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: active ? themeColor : clF9F9F9,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: !active ? themeColor : Colors.transparent,
            width: 0.8,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: active ? Colors.white : themeColor,
            height: 1.4,
            fontFamily: 'times',
          ),
        ),
      ),
    );
  }
}
