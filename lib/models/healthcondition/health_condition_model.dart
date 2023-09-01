import 'dart:convert';

class HealthConditionModel {
  final int id;
  final String name;
  final String description;
  final String occurrenceVariation;
  final int healthConditionParentId;
  final bool isSignupDefault;

  HealthConditionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.occurrenceVariation,
    required this.healthConditionParentId,
    required this.isSignupDefault,
  });

  factory HealthConditionModel.empty() => HealthConditionModel(
        id: 0,
        name: '',
        description: '',
        occurrenceVariation: '',
        healthConditionParentId: 0,
        isSignupDefault: false,
      );

  factory HealthConditionModel.fromJson(Map<String, dynamic> json) {
    return HealthConditionModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      occurrenceVariation: json['occurrence_variation'],
      healthConditionParentId: json['health_condition_parent_id'],
      isSignupDefault: json['is_sign_up_default'],
    );
  }

  factory HealthConditionModel.fromString(String source) {
    return HealthConditionModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'occurrence_variation': occurrenceVariation,
        'health_condition_parent_id': healthConditionParentId,
        'is_sign_up_default': isSignupDefault,
      };

  @override
  String toString() => name;
}
