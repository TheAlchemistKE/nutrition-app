import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/fonts.dart';
import 'package:nutrinowapp/models/app/metric_model.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/ui/pages/food/components/food_details/food_details_nutrient_metrics_dropdown.dart';

class FoodDetailsNutritionTitle extends StatelessWidget {
  final FoodDetailsModel foodDetailsModel;

  const FoodDetailsNutritionTitle(this.foodDetailsModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 15, bottom: 30, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Nutrition Facts',
              style: roboto(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Metric dropdown
          Expanded(
            flex: 1,
            child: FoodDetailsNutrientMetricsDropDown(
              onChange: (MetricModel metric) => print(metric),
              defaultMetric: MetricModel(
                id: 1,
                value: '100 grams',
                description: '',
                isBase: false,
                groupId: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
