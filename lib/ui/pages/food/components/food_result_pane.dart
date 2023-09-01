import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';

import 'food_list_tile.dart';

class FoodResultPane extends StatelessWidget {
  final List<FoodDetailsModel> foodModels;

  const FoodResultPane(this.foodModels, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FoodListTile(foodModels[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.white24, height: 10);
          },
          itemCount: foodModels.length,
        ),
      ),
    );
  }
}
