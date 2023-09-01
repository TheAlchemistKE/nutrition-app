import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_model.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class MealPlanItemPage extends StatelessWidget {
  final FoodDiaryMealPlanItemModel mealPlanItem;

  const MealPlanItemPage({Key? key, required this.mealPlanItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: themeColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(child: standardHeaderTitle()),
            actions: [standardChartIconButton()],
          ),
        ),
      ),
    );
  }
}

void openMealPlanItemPage(
    BuildContext context, FoodDiaryMealPlanItemModel mealPlan) {
  ModalDialog.showDialogWidget(
    context,
    MealPlanItemPage(mealPlanItem: mealPlan),
  );
}
