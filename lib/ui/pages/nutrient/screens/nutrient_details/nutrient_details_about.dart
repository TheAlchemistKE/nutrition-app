import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/nutrient/components/nutrient_list_tile.dart';

class NutrientDetailsAbout extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientDetailsAbout(this.nutrientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        color: Colors.white,
        child: Column(
          children: [
            // Detailed description
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                nutrientModel.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: themeColor,
                  fontSize: 14,
                  height: 1.4,
                  fontFamily: 'times',
                ),
              ),
            ),

            SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Daily intake
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: themeColor)),
                  ),
                  child: Text(
                    'Daily Intake'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: themeColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),

                SizedBox(height: 10),

                NutrientListTileContentIntake(
                  nutrientModel,
                  valueColor: Colors.white,
                ),
              ],
            ),

            SizedBox(height: 35),

            // List of foods
            if (nutrientModel.foodItems.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Selected food source
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: themeColor)),
                    ),
                    child: Text(
                      'Selected Food Source'.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),

                  Wrap(
                    spacing: 10,
                    children: nutrientModel.foodItems.map((String food) {
                      if (food.isEmpty) return Container();
                      return OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(width: 0.8, color: themeColor),
                        ),
                        child: Text(
                          food.inCaps,
                          style: TextStyle(color: themeColor),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class NutrientDetailsAboutFoodCapsule extends StatelessWidget {
  final String name;
  final Color foregroundColor;
  final Color backgroundColor;

  const NutrientDetailsAboutFoodCapsule(this.name,
      {Key? key, Color? foregroundColor, Color? backgroundColor})
      : foregroundColor = foregroundColor ?? Colors.black,
        backgroundColor = backgroundColor ?? Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      margin: EdgeInsets.only(right: 8, bottom: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        name,
        style: opensSans(
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
