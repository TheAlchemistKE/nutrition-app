import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/food/screens/food_details/food_details.dart';

class FoodListTile extends StatelessWidget {
  final FoodDetailsModel foodModel;

  const FoodListTile(this.foodModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openFoodDetails(context, foodModel),
      child: Container(
        decoration: BoxDecoration(
            color: themeColor,
            border: Border.symmetric(
              vertical: BorderSide(
                width: 1,
                color: Colors.grey.shade900,
              ),
            )),
        padding: EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: cl782D3A,
            radius: 36,
            child: Text(
              foodModel.name.firstChar,
              style: opensSans(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodModel.cleanName.toUpperCase(),
                style: roboto(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 3),

              // Manufacturer
              Container(
                child: Text(
                  foodModel.manufacture.inCaps,
                  style: roboto(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                Text(
                  foodModel.cleanDescription.inCaps,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: opensSans(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Brief macro-nutrients description
                // Container(
                //   child: Wrap(
                //     children: [
                //       for (int i = 0;
                //           i < min(3, foodModel.macroNutrients.length);
                //           i++)
                //         FoodNutrientCapsule(foodModel.macroNutrients[i]),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_right_sharp,
                size: 48,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodNutrientCapsule extends StatelessWidget {
  final Decoration decoration;
  final NutrientModel nutrientModel;

  const FoodNutrientCapsule(this.nutrientModel,
      {Key? key, this.decoration = const BoxDecoration()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: EdgeInsets.only(right: 6, bottom: 4),
      decoration: BoxDecoration(
        color: nutrientModel.bgColor.toColor(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            nutrientModel.name.inCaps,
            style: roboto(
              style: TextStyle(
                color: nutrientModel.fgColor.toColor(),
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 3),
          Text(
            nutrientModel.amount.toString(),
            style: roboto(
              style: TextStyle(
                color: nutrientModel.fgColor.toColor(),
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            nutrientModel.amountMetric,
            style: roboto(
              style: TextStyle(
                color: nutrientModel.fgColor.toColor(),
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
