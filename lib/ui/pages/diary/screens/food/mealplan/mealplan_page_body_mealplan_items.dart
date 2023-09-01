import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_model.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';

class MealPlanDetailsPageBodyMealPlanItems extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  const MealPlanDetailsPageBodyMealPlanItems(this.mealPlan, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mealPlan.mealPlanItems.isNotEmpty) {
      return nutrientItems(mealPlan.mealPlanItems);
    }
    // TODO: fetch from API
    return nutrientItems([]);
  }

  Widget nutrientItems(List<FoodDiaryMealPlanItemModel> mealPlanItems) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mealPlanItems.length,
      itemBuilder: (BuildContext context, int index) {
        return nutrientItem(context, mealPlanItems[index]);
      },
    );
  }

  Widget nutrientItem(BuildContext context, FoodDiaryMealPlanItemModel item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: themeColor,
                ),
          ),
          Text(
            item.quantityDisplay,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: themeColor,
                ),
          ),
        ],
      ),
    );
  }
}
