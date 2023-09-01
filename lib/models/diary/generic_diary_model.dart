import 'dart:convert';

class GenericDiaryProgressModel {
  final double current;
  final String currentMetric;
  final String goalMetric;
  final double goal;

  GenericDiaryProgressModel({
    required this.current,
    required this.currentMetric,
    required this.goalMetric,
    required this.goal,
  });

  factory GenericDiaryProgressModel.fromJson(Map<String, dynamic> json) =>
      GenericDiaryProgressModel(
        current: json['current'],
        currentMetric: json['current_metric'],
        goal: json['goal'],
        goalMetric: json['goal_metric'],
      );

  factory GenericDiaryProgressModel.fromString(String source) {
    return GenericDiaryProgressModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'current': current,
        'current_metric': currentMetric,
        'goal': goal,
        'goal_metric': goalMetric,
      };
}
