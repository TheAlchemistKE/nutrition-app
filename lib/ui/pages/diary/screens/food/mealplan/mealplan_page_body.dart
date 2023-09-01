import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page_body_mealplan_items.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page_body_nutrition_counts.dart';

class MealPlanDetailsPageBody extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  final double top;

  const MealPlanDetailsPageBody(this.mealPlan, {Key? key, required this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, right: 30, left: 30, top: top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Nutrient total count
          sectionTitle(context, 'Total Count'),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: clF0F0F0,
              borderRadius: BorderRadius.circular(8),
            ),
            child: MealPlanDetailsPageBodyNutritionCounts(mealPlan),
          ),
          SizedBox(height: 25),

          // Items section
          sectionTitle(context, 'Items'),
          SizedBox(height: 10),
          MealPlanDetailsPageBodyMealPlanItems(mealPlan),

          // Ingredients section
          // sectionTitle(context, 'Ingredients'),
          // SizedBox(height: 10),
          // MealPlanDetailsPageBodyIngredients(),
        ],
      ),
    );
  }

  Widget sectionTitle(BuildContext context, String name) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: themeColor, width: 0.8),
        ),
      ),
      child: Text(
        name.toUpperCase(),
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: themeColor,
              fontSize: 15,
            ),
      ),
    );
  }
}
