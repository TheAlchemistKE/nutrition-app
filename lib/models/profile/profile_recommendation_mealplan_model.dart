import 'dart:convert';

class ProfileRecommendationMealPlanModel {
  final int id;
  final String name;
  final String description;
  final DateTime mealTimeOfDay;
  final String frequency;
  final int frequencyCount;
  final int repeatOnDay;
  final DateTime mealPlanStartDate;
  final DateTime mealPlanEndDate;
  final bool isSnoozed;
  final DateTime snoozedAt;

  ProfileRecommendationMealPlanModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.mealTimeOfDay,
      required this.frequency,
      required this.frequencyCount,
      required this.repeatOnDay,
      required this.mealPlanStartDate,
      required this.mealPlanEndDate,
      required this.isSnoozed,
      required this.snoozedAt});

  factory ProfileRecommendationMealPlanModel.fromJson(
      Map<String, dynamic> json) {
    return ProfileRecommendationMealPlanModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      mealTimeOfDay: json['meal_time_of_day'],
      isSnoozed: json['is_snoozed'],
      repeatOnDay: json['repeat_on_day'],
      mealPlanStartDate: json['meal_plan_start_date'],
      mealPlanEndDate: json['meal_plan_end_date'],
      snoozedAt: json['snoozed_at'],
      frequency: json['frequency'],
      frequencyCount: json['frequency_count'],
    );
  }

  factory ProfileRecommendationMealPlanModel.fromString(String source) {
    return ProfileRecommendationMealPlanModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'meal_time_of_day': mealTimeOfDay,
        'is_snoozed': isSnoozed,
        'repeat_on_day': repeatOnDay,
        'meal_plan_start_date': mealPlanStartDate,
        'meal_plan_end_date': mealPlanEndDate,
        'snoozed_at': snoozedAt,
        'frequency': frequency,
        'frequency_count': frequencyCount,
      };
}
