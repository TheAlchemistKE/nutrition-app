import 'dart:convert';

import 'package:intl/intl.dart';

class GenericDiaryHistoryModel {
  final DateTime dateTime;
  final double value;
  final String metric;
  final double change;
  final String changeMetric;

  GenericDiaryHistoryModel({
    required this.dateTime,
    required this.value,
    required this.metric,
    required this.change,
    required this.changeMetric,
  });

  factory GenericDiaryHistoryModel.fromJson(Map<String, dynamic> json) =>
      GenericDiaryHistoryModel(
        value: json['value'],
        changeMetric: json['change_metric'],
        change: json['change'],
        metric: json['metric'],
        dateTime: json['date_time'],
      );

  factory GenericDiaryHistoryModel.fromString(String source) {
    return GenericDiaryHistoryModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'change_metric': changeMetric,
        'change': change,
        'metric': metric,
        'date_time': dateTime,
      };

  String get cleanDate {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  String get changeDisplay => '$change $changeMetric';

  String get valueDisplay => '$value $metric';
}
