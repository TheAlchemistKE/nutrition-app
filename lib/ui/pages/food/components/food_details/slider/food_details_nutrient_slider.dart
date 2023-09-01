import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';

final double kThumbnailHeightOffset = 6;
final double kThumbnailWidth = 47;
final double kSliderHeight = 18;
final double kOverallHeight = kSliderHeight + (kThumbnailHeightOffset * 2);

class FoodDetailsNutrientSlider extends StatelessWidget {
  final NutrientModel nutrientModel;
  final double width;

  FoodDetailsNutrientSlider(this.nutrientModel, {required this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var color = nutrientModel.bgColor.isEmpty
        ? themeColor
        : nutrientModel.bgColor.toColor();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      nutrientModel.name.inCaps,
                      style: roboto(
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      nutrientModel.amountMetric,
                      style: roboto(
                        style: TextStyle(
                          fontSize: 12.5,
                          color: clB5B5B5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  constraints: BoxConstraints(
                    maxWidth: size.width,
                    maxHeight: kOverallHeight,
                  ),
                  child: Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: kSliderHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 6,
                        ),
                      ),
                      Positioned(
                        width: width,
                        height: kSliderHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width,
                        top: -kThumbnailHeightOffset,
                        bottom: -kThumbnailHeightOffset,
                        child: Container(
                          width: kThumbnailWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          child: Text(
                            nutrientModel.amount,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
