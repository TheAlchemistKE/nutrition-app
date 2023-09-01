import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplanitem/mealplan_item_page.dart';
import 'package:nutrinowapp/ui/widgets/shimmer_loading.dart';

class FoodDiaryPageBodyMealPlanItem extends StatelessWidget {
  final FoodDiaryMealPlanItemModel mealPlanItem;

  FoodDiaryPageBodyMealPlanItem(this.mealPlanItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => openMealPlanItemPage(context, mealPlanItem),
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      leading: FoodDiaryPageBodyMealPlanItemLeading(mealPlanItem),
      title: Container(
        child: Text(
          mealPlanItem.name,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: themeColor,
                fontSize: 16,
              ),
        ),
      ),
      subtitle: Container(child: Text('120 kcal')),
    );
  }
}

class FoodDiaryPageBodyMealPlanItemLeading extends StatelessWidget {
  final FoodDiaryMealPlanItemModel mealPlanItem;

  const FoodDiaryPageBodyMealPlanItemLeading(this.mealPlanItem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: mealPlanItem.labelColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mealPlanItem.label[0].toUpperCase(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
              ),
              Text(
                mealPlanItem.label.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -4,
          top: -4,
          child: CircleAvatar(
            backgroundColor: mealPlanItem.alertColor,
            radius: 7,
          ),
        ),
      ],
    );
  }
}

class FoodDiaryPageBodyMealPlanItemLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          title: Container(width: 60, height: 20, color: Colors.white),
          subtitle: Container(
            margin: EdgeInsets.only(top: 20),
            width: 30,
            height: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
