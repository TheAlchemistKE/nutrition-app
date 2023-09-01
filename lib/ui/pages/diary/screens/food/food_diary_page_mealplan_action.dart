import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page.dart';

class FoodDiaryPageBodyMealPlanAction extends StatelessWidget {
  final FoodDiaryMealPlanModel foodMealPlanModel;

  FoodDiaryPageBodyMealPlanAction(this.foodMealPlanModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(),
              backgroundColor: cl2D786E,
              shape: StadiumBorder(),
            ),
            onPressed: () => openMealPlanPage(context, foodMealPlanModel),
            child: Text(
              'Customize',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.grey.shade200, width: 1.2)),
            onPressed: () => '',
            child: Text(
              'Mark as done',
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: foodMealPlanModel.alertColor,
            radius: 8,
          ),
        ],
      ),
    );
  }
}
