import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';

class HomePageLandingSlideshowPane extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height =
        goldenRatioLarge(min(size.width, size.height)) - kToolbarHeight;
    return Container(
      constraints: BoxConstraints(
        maxHeight: kTopHeaderMaxHeight,
        minHeight: kTopHeaderMinHeight,
      ),
      decoration: BoxDecoration(color: themeColor),
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: ListTile(
        title: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Text(
            'Track your progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MEAL PLAN',
              style: TextStyle(
                color: clD4DCDE,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(height: 10),
            Text(
              'Setup your mealplan and track your '
              'nutrition progress to get better results',
              style: TextStyle(
                color: cl94A7AD,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: CircleAvatar(radius: 40, backgroundColor: Colors.transparent),
      ),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(220.0);
}
