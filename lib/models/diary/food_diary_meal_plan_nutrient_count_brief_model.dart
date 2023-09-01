import 'dart:convert';

class FoodDiaryMealPlanNutrientCountBriefModel {
  final int id;
  final String name;
  final double value;
  final String metric;

  FoodDiaryMealPlanNutrientCountBriefModel({
    required this.id,
    required this.name,
    required this.value,
    required this.metric,
  });

  factory FoodDiaryMealPlanNutrientCountBriefModel.fromJson(
          Map<String, dynamic> json) =>
      FoodDiaryMealPlanNutrientCountBriefModel(
        id: json['id'],
        name: json['name'],
        value: json['value'],
        metric: json['metric'],
      );

  factory FoodDiaryMealPlanNutrientCountBriefModel.fromString(String source) {
    return FoodDiaryMealPlanNutrientCountBriefModel.fromJson(
        jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
        'metric': metric,
      };
}
