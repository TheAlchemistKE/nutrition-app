import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/shimmer/loader.dart';

class MealPlanDetailsPageImage extends StatelessWidget {
  final FoodDiaryMealPlanModel mealPlan;

  final double imgSize;
  final double scaleFactor;

  const MealPlanDetailsPageImage(
    this.mealPlan, {
    Key? key,
    required this.imgSize,
    this.scaleFactor = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imgSize,
      height: imgSize,
      constraints: BoxConstraints(
        maxWidth: imgSize,
        maxHeight: imgSize,
      ),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Loader.circularBorder(),
        errorWidget: (context, url, error) => Loader.circularBorder(),
        imageUrl: Api.api(prefix: 'static')
            .uri(path: 'images/mealplan/lunch.png')
            .toString(),
      ),
    );
  }
}
