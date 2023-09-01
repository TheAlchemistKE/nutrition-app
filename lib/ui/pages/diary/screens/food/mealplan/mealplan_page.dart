import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/constants/dimensions.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page_body.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page_header.dart';
import 'package:nutrinowapp/ui/pages/diary/screens/food/mealplan/mealplan_page_image.dart';
import 'package:nutrinowapp/ui/widgets/modal_dialog.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class MealPlanDetailsPage extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  final imgScaleFactor;
  final imgTopPercentage;

  const MealPlanDetailsPage({
    Key? key,
    this.imgScaleFactor = 1.3,
    this.imgTopPercentage = 0.55,
    required this.mealPlan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var headerIdealSize = idealSize(
      goldenRatioSmall(size.width),
      kTopHeaderMinHeight,
      kTopHeaderMaxHeight,
    );
    var imgSize = headerIdealSize * imgScaleFactor;
    var imgTopMargin = headerIdealSize - (imgSize * imgTopPercentage);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: themeColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: themeColor,
            elevation: 0.0,
            title: Center(child: standardHeaderTitle()),
            actions: [standardChartIconButton()],
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MealPlanDetailsPageHeader(
                          mealPlan,
                          height: headerIdealSize,
                          minHeight: kTopHeaderMinHeight,
                          maxHeight: kTopHeaderMaxHeight,
                        ),
                        MealPlanDetailsPageBody(
                          mealPlan,
                          top: imgSize * (1 - imgTopPercentage),
                        ),
                      ],
                    ),
                    Positioned(
                      top: imgTopMargin,
                      left: size.width / 2 - imgSize / 2,
                      child: MealPlanDetailsPageImage(
                        mealPlan,
                        imgSize: imgSize,
                        scaleFactor: imgScaleFactor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void openMealPlanPage(BuildContext context, FoodDiaryMealPlanModel mealPlan) {
  ModalDialog.showDialogWidget(
    context,
    MealPlanDetailsPage(mealPlan: mealPlan),
  );
}
