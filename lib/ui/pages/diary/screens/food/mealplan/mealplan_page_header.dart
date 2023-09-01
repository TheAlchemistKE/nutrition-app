import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';

class MealPlanDetailsPageHeader extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  final double height;
  final double minHeight;
  final double maxHeight;

  const MealPlanDetailsPageHeader(
    this.mealPlan, {
    Key? key,
    required this.height,
    this.minHeight = kTopHeaderMinHeight,
    this.maxHeight = kTopHeaderMaxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: themeColor,
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealPlan.name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
                Text('22 Aug 2021', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          Expanded(child: SizedBox(height: 1)),
          Container(
            width: double.infinity,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
