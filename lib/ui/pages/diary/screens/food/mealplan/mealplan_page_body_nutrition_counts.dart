import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';

class MealPlanDetailsPageBodyNutritionCounts extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  const MealPlanDetailsPageBodyNutritionCounts(this.mealPlan, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Wrap(
        spacing: 12,
        alignment: WrapAlignment.spaceBetween,
        children: [
          nutrientCount(context, 'Calories', '120 Kcal'),
          nutrientCount(context, 'Protein', '22g'),
          nutrientCount(context, 'Energy', '12g'),
          nutrientCount(context, 'Fat', '10g'),
        ],
      ),
    );
  }

  Widget nutrientCount(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w400,
                color: themeColor,
              ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColor,
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
