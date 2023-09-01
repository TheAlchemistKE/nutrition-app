import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/service/nutrient/nutrient_service.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_list_tile.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class NutrientCategoryFood extends StatelessWidget {
  final NutrientCategoryModel nutrientCategory;

  const NutrientCategoryFood(this.nutrientCategory, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFutureBuilder(
        source: NutrientService.fetchNutrientCategoryFoods(nutrientCategory),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return _buildErrorWidget();
          }
          return NutrientCategoryFoodPane(snapshot.data);
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay(error.toString()),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container();
  }
}

class NutrientCategoryFoodPane extends StatelessWidget {
  final List<FoodDetailsModel> foods;

  const NutrientCategoryFoodPane(this.foods, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.white,
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => FoodListTile(foods[index]),
          separatorBuilder: (context, index) {
            return Divider(color: Colors.white24, height: 10);
          },
          itemCount: foods.length,
        ),
      ),
    );
  }
}
