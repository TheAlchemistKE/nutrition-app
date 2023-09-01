import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';

class ShareButton extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  final FontWeight textWeight;
  final Function? onPressed;
  final double iconSize;

  const ShareButton({
    Key? key,
    required this.iconColor,
    this.iconSize = 28,
    required this.textColor,
    this.textWeight = FontWeight.w800,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed!(),
      child: Container(
        child: Row(
          children: [
            Icon(Icons.share_sharp, size: iconSize, color: iconColor),
            SizedBox(width: 10),
            Text(
              'SHARE',
              style: roboto(
                style: TextStyle(color: textColor, fontWeight: textWeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
