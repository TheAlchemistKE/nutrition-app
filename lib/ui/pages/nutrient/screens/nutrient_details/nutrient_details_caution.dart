import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';

class NutrientDetailsCaution extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientDetailsCaution(this.nutrientModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Special Consideration
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: themeColor)),
              ),
              child: Text(
                'Special Consideration'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),

            SizedBox(height: 8),

            Text(
              nutrientModel.specialConsiderations,
              textAlign: TextAlign.justify,
              style: opensSans(
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: nutrientModel.fgColor.toColor(),
                ),
              ),
            ),

            SizedBox(height: 45),

            // Effects of Excessive Consumption
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: themeColor)),
              ),
              child: Text(
                'Effects of Excessive Consumption'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),

            SizedBox(height: 8),

            Text(
              nutrientModel.aboveLevelImpact,
              textAlign: TextAlign.justify,
              style: opensSans(
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: nutrientModel.fgColor.toColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
