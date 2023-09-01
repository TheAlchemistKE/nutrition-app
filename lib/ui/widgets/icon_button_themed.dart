import 'package:flutter/material.dart';

class IconButtonThemed extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final Function onPressed;

  const IconButtonThemed({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () => onPressed(),
        icon: icon,
        label: label,
      ),
    );
  }
}
