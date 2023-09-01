import 'dart:convert';

class RecommendationGoalTypeModel {}

class RecommendationGoalModel {
  final int id;
  final String name;
  final String description;
  final RecommendationGoalTypeModel type;
  final DateTime targetDate;
  final String metric;
  final double targetValueLowerBound;
  final double targetValue;
  final double targetValueUpperBound;

  RecommendationGoalModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.targetDate,
    required this.metric,
    required this.targetValueLowerBound,
    required this.targetValue,
    required this.targetValueUpperBound,
  });

  factory RecommendationGoalModel.fromJson(Map<String, dynamic> json) {
    return RecommendationGoalModel(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      type: json['type'],
      targetDate: json['target_date'],
      metric: json['metric'],
      targetValueLowerBound: json['target_value_lower_bound'],
      targetValueUpperBound: json['target_value_upper_bound'],
      targetValue: json['target_value'],
    );
  }

  factory RecommendationGoalModel.fromString(String source) {
    return RecommendationGoalModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'type': type,
        'target_date': targetDate,
        'metric': metric,
        'target_value_lower_bound': targetValueLowerBound,
        'target_value_upper_bound': targetValueUpperBound,
        'target_value': targetValue,
      };
}
