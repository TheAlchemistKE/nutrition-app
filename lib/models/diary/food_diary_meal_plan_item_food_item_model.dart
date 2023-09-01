import 'dart:convert';

import 'package:nutrinowapp/models/food/food_details_model.dart';

class FoodDiaryMealPlanItemFoodItemModel {
  final int id;
  final FoodDetailsModel foodItem;
  final double quantity;
  final String metric;

  FoodDiaryMealPlanItemFoodItemModel({
    required this.id,
    required this.foodItem,
    required this.quantity,
    required this.metric,
  });

  factory FoodDiaryMealPlanItemFoodItemModel.fromJson(
          Map<String, dynamic> json) =>
      FoodDiaryMealPlanItemFoodItemModel(
        id: json['id'],
        foodItem: FoodDetailsModel.fromJson(json['name']),
        quantity: json['quantity'],
        metric: json['metric'],
      );

  factory FoodDiaryMealPlanItemFoodItemModel.fromString(String source) {
    return FoodDiaryMealPlanItemFoodItemModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'uuid': id,
        'food_item': foodItem,
        'quantity': quantity,
        'metric': metric,
      };
}
