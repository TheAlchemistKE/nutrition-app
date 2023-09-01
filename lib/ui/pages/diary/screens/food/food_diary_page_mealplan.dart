import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_mealplan_action.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_mealplan_item.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_mealplan_title.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class FoodDiaryPageBodyMealPlan extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  FoodDiaryPageBodyMealPlan(this.mealPlan);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openMealPlanPage(context, mealPlan),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade100,
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            FoodDiaryPageBodyMealPlanTitle(title: mealPlan.name),
            SizedBox(height: 20),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: mealPlan.mealPlanItems.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey.shade100, thickness: 1.6);
              },
              itemBuilder: (BuildContext context, int index) {
                if (index == mealPlan.mealPlanItems.length - 1) {
                  return Column(
                    children: [
                      FoodDiaryPageBodyMealPlanItem(
                        mealPlan.mealPlanItems[index],
                      ),
                      FoodDiaryPageBodyMealPlanAction(mealPlan),
                    ],
                  );
                }
                return FoodDiaryPageBodyMealPlanItem(
                  mealPlan.mealPlanItems[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FoodDiaryPageBodyMealPlanLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade100,
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerLoading(
              isLoading: true,
              child: Container(width: 100, height: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey.shade100, thickness: 1.6);
              },
              itemBuilder: (BuildContext context, int index) {
                return FoodDiaryPageBodyMealPlanItemLoader();
              },
            )
          ],
        ),
      ),
    );
  }
}
