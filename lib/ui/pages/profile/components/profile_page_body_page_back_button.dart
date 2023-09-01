import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class ProfilePageBodyPageBackButton extends StatelessWidget {
  final Function onPressed;

  const ProfilePageBodyPageBackButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: BackButton(
          color: themeColor,
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
