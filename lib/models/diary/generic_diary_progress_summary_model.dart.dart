import 'dart:convert';

class GenericDiaryProgressSummaryModel {
  final String current;
  final String currentMetric;
  final String goal;
  final String goalMetric;

  GenericDiaryProgressSummaryModel({
    required this.current,
    required this.currentMetric,
    required this.goal,
    required this.goalMetric,
  });

  factory GenericDiaryProgressSummaryModel.fromJson(
          Map<String, dynamic> json) =>
      GenericDiaryProgressSummaryModel(
        currentMetric: json['current_metric'],
        current: json['current'],
        goalMetric: json['goal_metric'],
        goal: json['goal'],
      );

  factory GenericDiaryProgressSummaryModel.fromString(String source) {
    return GenericDiaryProgressSummaryModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'goal': goal,
        'goal_metric': goalMetric,
        'current': current,
        'current_metric': currentMetric,
      };

  String get currentDisplay => '$current $currentMetric';

  String get goalDisplay => '$goal $goalMetric';
}
