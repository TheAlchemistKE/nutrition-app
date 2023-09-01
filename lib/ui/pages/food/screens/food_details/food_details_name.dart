import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';

class FoodDetailsName extends StatelessWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsName(this.foodDetailsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 25, right: 30, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Container(
            child: Text(
              foodDetailsModel.cleanName.inCaps,
              style: roboto(
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
              ),
            ),
          ),

          // Category
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              foodDetailsModel.categoryName.inCaps,
              style: roboto(
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: cl8A8686,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
