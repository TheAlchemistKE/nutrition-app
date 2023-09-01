import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/service/nutrient/nutrient_service.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_list_tile.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class NutrientDetailsFoods extends StatelessWidget {
  final NutrientModel nutrientModel;

  const NutrientDetailsFoods(this.nutrientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.only(bottom: 10),
      child: CustomFutureBuilder(
        source: NutrientService.fetchNutrientFoods(nutrientModel),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return Container();
          }
          return NutrientDetailsFoodPane(snapshot.data);
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay(error.toString()),
      ),
    );
  }
}

class NutrientDetailsFoodPane extends StatelessWidget {
  final List<FoodDetailsModel> nutrientFoods;

  const NutrientDetailsFoodPane(this.nutrientFoods, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FoodListTile(nutrientFoods[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.white24, height: 10);
        },
        itemCount: nutrientFoods.length,
      ),
    );
  }
}
