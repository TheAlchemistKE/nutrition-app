import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';

class FoodDetailsNutrientCapsule extends StatelessWidget {
  final NutrientModel nutrientModel;

  const FoodDetailsNutrientCapsule(this.nutrientModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: nutrientModel.bgColor.toColor(),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            nutrientModel.name.inCaps,
            style: roboto(
              style: TextStyle(
                color: nutrientModel.fgColor.toColor(),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 4),
          Text(
            nutrientModel.actualAmount,
            style: roboto(
              style: TextStyle(
                color: nutrientModel.fgColor.toColor(),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
