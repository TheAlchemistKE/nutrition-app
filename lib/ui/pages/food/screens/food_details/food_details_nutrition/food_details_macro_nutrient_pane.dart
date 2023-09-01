import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_details/food_details_nutrient_capsule.dart';
import 'package:nutrinowapp/ui/widgets/future_builder_body.dart';
import 'package:nutrinowapp/ui/widgets/widgets.dart';

class FoodDetailsMacroNutrientPane extends StatefulWidget {
  final FoodDetailsModel foodItem;
  final int limit;

  const FoodDetailsMacroNutrientPane(
      {Key? key, required this.limit, required this.foodItem})
      : super(key: key);

  @override
  _FoodDetailsMacroNutrientPaneState createState() =>
      _FoodDetailsMacroNutrientPaneState();
}

class _FoodDetailsMacroNutrientPaneState
    extends State<FoodDetailsMacroNutrientPane> {
  late Future<dynamic> _futureMacroNutrient;

  @override
  void initState() {
    super.initState();
    setFutureCategory();
  }

  void setFutureCategory() => _futureMacroNutrient =
      Api.api().get('/food/${widget.foodItem.id}/macro-nutrients');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 30),
      child: CustomFutureBuilder(
        source: _futureMacroNutrient,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!(snapshot.data is List<dynamic>) ||
              !snapshot.hasData ||
              snapshot.data.length < 1) {
            return _buildErrorWidget();
          }

          var items = <NutrientModel>[];
          snapshot.data.forEach(
              (i) => items.addAll(NutrientCategoryModel.fromJson(i).nutrients));

          var z = min(widget.limit, items.length);
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < z; i++) FoodDetailsNutrientCapsule(items[i]),
            ],
          );
        },
        loader: circularProgress,
        errorHandler: (error) => FutureBuilderErrorDisplay('$error'),
      ),
    );
  }

  Widget _buildErrorWidget() => Container();
}
