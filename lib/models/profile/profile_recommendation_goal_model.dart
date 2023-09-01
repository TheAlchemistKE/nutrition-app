import 'dart:convert';

class RecommendationGoalTypeModel {}

class ProfileRecommendationGoalModel {
  final int id;
  final String name;
  final String description;
  final int recommendationGoalId;
  final RecommendationGoalTypeModel type;
  final int targetDurationDays;
  final DateTime startDate;
  final String metric;
  final double targetValueLowerBound;
  final double targetValue;
  final double targetValueUpperBound;
  final double targetPercentAchieved;
  final double targetAchievedDate;

  ProfileRecommendationGoalModel({
    required this.id,
    required this.name,
    required this.description,
    required this.recommendationGoalId,
    required this.type,
    required this.targetDurationDays,
    required this.startDate,
    required this.metric,
    required this.targetValueLowerBound,
    required this.targetValue,
    required this.targetValueUpperBound,
    required this.targetPercentAchieved,
    required this.targetAchievedDate,
  });

  factory ProfileRecommendationGoalModel.fromJson(Map<String, dynamic> json) {
    return ProfileRecommendationGoalModel(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      recommendationGoalId: json['recommendation_goal_id'],
      type: json['type'],
      targetDurationDays: json['target_duration_days'],
      startDate: json['start_date'],
      metric: json['metric'],
      targetValueLowerBound: json['target_value_lower_bound'],
      targetValueUpperBound: json['target_value_upper_bound'],
      targetValue: json['target_value'],
      targetPercentAchieved: json['target_percent_achieved'],
      targetAchievedDate: json['target_achieved_date'],
    );
  }

  factory ProfileRecommendationGoalModel.fromString(String source) {
    return ProfileRecommendationGoalModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'type': type,
        'start_date': startDate,
        'target_duration_days': targetDurationDays,
        'metric': metric,
        'target_value_lower_bound': targetValueLowerBound,
        'target_value_upper_bound': targetValueUpperBound,
        'target_value': targetValue,
      };
}
