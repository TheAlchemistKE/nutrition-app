import 'dart:convert';

class GenericDiaryProgressModel {
  final List<String> durationRange;
  final List<double> valueRange;
  final List<double> values;

  GenericDiaryProgressModel({
    required this.durationRange,
    required this.valueRange,
    required this.values,
  });

  factory GenericDiaryProgressModel.fromJson(Map<String, dynamic> json) =>
      GenericDiaryProgressModel(
        valueRange: [],
        durationRange: [],
        values: [],
      );

  factory GenericDiaryProgressModel.fromString(String source) {
    return GenericDiaryProgressModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'value_range': valueRange,
        'duration_range': durationRange,
        'values': values,
      };
}
