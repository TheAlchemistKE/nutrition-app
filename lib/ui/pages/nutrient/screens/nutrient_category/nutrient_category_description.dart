import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';

class NutrientCategoryDescription extends StatelessWidget {
  final NutrientCategoryModel category;

  const NutrientCategoryDescription(this.category, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 25),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            category.description,
            textAlign: TextAlign.justify,
            style: kreon(
              style: TextStyle(
                fontSize: 17,
                color: themeColor,
                height: 1.3,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),

        // Daily intake
        if (category.dailyIntake.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    category.dailyIntake,
                    style: roboto(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: themeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        // General food details
        if (category.foodItems.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  children: category.foodItems.map((String food) {
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
            ),
          ),

        //Note
        if (category.note.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: clE1EEDD,
              borderRadius: BorderRadius.only(),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: Colors.green.shade600,
                  size: 28,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    category.note,
                    style: TextStyle(
                      color: clB4A9A9,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'times',
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
