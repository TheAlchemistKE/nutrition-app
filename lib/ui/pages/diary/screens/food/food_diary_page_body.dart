import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/service/diary/food/food_diary_service.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/food_diary_page_mealplan.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/shimmer.dart';

class FoodDiaryPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        color: clF9F9F9,
        border: Border.all(width: 0, color: clF9F9F9),
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          CustomFutureBuilder(
            source: FoodDiaryService.fetchMealPlans(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!(snapshot.data is List<dynamic>) ||
                  !snapshot.hasData ||
                  snapshot.data.length < 1) {
                return foodDiaryPageMealPlanListLoader();
              }
              return foodDiaryPageMealPlanList(snapshot.data);
            },
            loader: foodDiaryPageMealPlanListLoader(),
            errorHandler: (error) => foodDiaryPageMealPlanListLoader(),
          ),
        ],
      ),
    );
  }

  Widget foodDiaryPageMealPlanList(List<FoodDiaryMealPlanModel> mealPlans) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return FoodDiaryPageBodyMealPlan(mealPlans[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 25);
      },
    );
  }

  Widget foodDiaryPageMealPlanListLoader({int length = 3}) {
    return Shimmer(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return FoodDiaryPageBodyMealPlanLoader();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 25);
        },
      ),
    );
  }
}

class FoodDiaryPageBodyTitle extends StatelessWidget {
  final bool isPinned;

  const FoodDiaryPageBodyTitle({Key? key, this.isPinned = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: clF9F9F9),
        borderRadius: isPinned
            ? BorderRadius.zero
            : BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
        color: clF9F9F9,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Recommendation",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
          ),
          Icon(Icons.calendar_today, color: themeColor),
        ],
      ),
    );
  }
}
