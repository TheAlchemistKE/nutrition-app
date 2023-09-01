import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_item_food_item_model.dart';

class FoodDiaryMealPlanItemModel {
  final int id;
  final String name;
  final String description;
  final double quantity;
  final String quantityMetric;
  final List<FoodDiaryMealPlanItemFoodItemModel> foodItems;
  final String label;
  final Color labelColor;
  final Color alertColor;
  final String img;

  FoodDiaryMealPlanItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.quantityMetric,
    required this.foodItems,
    required this.label,
    this.labelColor = themeColor,
    this.alertColor = Colors.transparent,
    required this.img,
  });

  factory FoodDiaryMealPlanItemModel.fromJson(Map<String, dynamic> json) =>
      FoodDiaryMealPlanItemModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        quantity: json['quantity'],
        quantityMetric: json['quantity_metric'],
        foodItems: [],
        img: json['img'],
        // foodItems: json['items'] != null
        //     ? (json['items'] as List)
        //         .map((i) => FoodDiaryMealPlanItemFoodItemModel.fromJson(i))
        //         .toList()
        //     : <FoodDiaryMealPlanItemFoodItemModel>[],
        label: json['label'],
        labelColor: json['label_color'] != null
            ? (json['label_color'] as String).toColor()
            : themeColor,
        alertColor: json['alert_color'] != null
            ? (json['alert_color'] as String).toColor()
            : Colors.transparent,
      );

  factory FoodDiaryMealPlanItemModel.fromString(String source) {
    return FoodDiaryMealPlanItemModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'quantity': quantity,
        'quantity_metric': quantityMetric,
        // 'items': foodItem,
        'label': label,
      };

  String get quantityDisplay => '$quantity $quantityMetric';
}
