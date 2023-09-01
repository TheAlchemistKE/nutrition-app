import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class ProfilePageBodyPageBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfilePageBodyPageBackButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: BackButton(
          color: themeColor,
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}

class ProfilePageBodyPageCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ProfilePageBodyPageCloseButton({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: CloseButton(
          color: themeColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
