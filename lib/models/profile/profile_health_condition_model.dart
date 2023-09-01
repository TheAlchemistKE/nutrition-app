import 'dart:convert';

import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';

class ProfileHealthConditionModel {
  final int id;
  final String knownFamilyHistory;
  final HealthConditionModel healthCondition;

  ProfileHealthConditionModel({
    required this.id,
    required this.knownFamilyHistory,
    required this.healthCondition,
  });

  factory ProfileHealthConditionModel.fromJson(Map<String, dynamic> json) {
    return ProfileHealthConditionModel(
      id: json['id'],
      knownFamilyHistory: json['known_family_history'],
      healthCondition: HealthConditionModel.fromJson(json['health_condition']),
    );
  }

  factory ProfileHealthConditionModel.fromString(String source) {
    return ProfileHealthConditionModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'known_family_history': knownFamilyHistory,
        'health_condition': healthCondition,
      };

  @override
  String toString() => healthCondition.name;
}
