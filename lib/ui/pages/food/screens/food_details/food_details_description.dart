import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';

class FoodDetailsDescription extends StatelessWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsDescription(this.foodDetailsModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        top: 10,
        bottom: 12,
        right: 30,
      ),
      child: Text(
        foodDetailsModel.cleanDescription.inCaps,
        maxLines: 8,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.justify,
        style: opensSans(
          style: TextStyle(
            fontSize: 15,
            color: cl5C5C5C,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
