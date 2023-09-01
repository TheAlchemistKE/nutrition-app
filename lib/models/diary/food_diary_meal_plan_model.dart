import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_model.dart';

class FoodDiaryMealPlanModel {
  final String uuid;
  final String name;
  final String description;
  final DateTime mealTimeOfDay;
  final List<FoodDiaryMealPlanItemModel> mealPlanItems;

  final Color alertColor;

  FoodDiaryMealPlanModel({
    required this.uuid,
    required this.name,
    required this.description,
    required this.mealTimeOfDay,
    required this.mealPlanItems,
    required this.alertColor,
  });

  factory FoodDiaryMealPlanModel.fromJson(Map<String, dynamic> json) =>
      FoodDiaryMealPlanModel(
        uuid: json['uuid'],
        name: json['name'],
        description: json['description'],
        mealTimeOfDay: json['meal_time_of_day'],
        mealPlanItems: json['items'] != null
            ? (json['items'] as List)
                .map((i) => FoodDiaryMealPlanItemModel.fromJson(i))
                .toList()
            : [],
        alertColor: json['alert_color'] != null
            ? (json['alert_color'] as String).toColor()
            : Colors.transparent,
      );

  factory FoodDiaryMealPlanModel.fromString(String source) {
    return FoodDiaryMealPlanModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'name': name,
        'description': description,
        'meal_time_of_day': mealTimeOfDay,
        'items': mealPlanItems,
        'alert_color': alertColor,
      };
}
