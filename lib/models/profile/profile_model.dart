import 'dart:convert';

import 'package:nutrinowapp/extensions/extensions.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';

enum ProfileGender {
  Male,
  Female,
  Other,
  PreferNotToSay,
  UnKnown,
}

class ProfileModel {
  final String profileHash;
  final String accountHash;

  final String name;
  final DateTime dob;
  final String location;

  final ProfileGender gender;

  final int physiologicalStatusId;

  final num height;
  final String heightMetric;

  final num weight;
  final String weightMetric;

  final int levelOfActivityId;

  int formStep = 0;

  List<ProfileHealthConditionModel> preExistingConditions = const [];

  ProfileModel({
    required this.profileHash,
    required this.accountHash,
    required this.name,
    required this.dob,
    required this.location,
    required this.gender,
    required this.physiologicalStatusId,
    required this.height,
    required this.heightMetric,
    required this.weight,
    required this.weightMetric,
    required this.levelOfActivityId,
    required this.preExistingConditions,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profileHash: json['pid'],
      accountHash: json['uid'],
      name: json['name'],
      location: json['location'],
      gender: (json['gender'] as String).gender,
      dob: DateTime.parse(json['dob']),
      physiologicalStatusId: json['physiological_status_id'] ?? 0,
      levelOfActivityId: json['level_of_activity_id'],
      height: json['height'],
      heightMetric: json['height_metric'],
      weight: json['weight'],
      weightMetric: json['weight_metric'],
      preExistingConditions: json['health_conditions'] != null
          ? (json['health_conditions'] as List)
              .map((i) => ProfileHealthConditionModel.fromJson(i))
              .toList()
          : <ProfileHealthConditionModel>[],
    );
  }

  factory ProfileModel.fromString(String source) {
    return ProfileModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'profile_hash': profileHash,
        'name': name,
        'location': location,
        'gender': gender.name,
        'dob': dob.toUtc().toIso8601String(),
        'physiological_status_id': physiologicalStatusId,
        'level_of_activity_id': levelOfActivityId,
        'height': height,
        'height_metric': heightMetric,
        'weight': weight,
        'weight_metric': weightMetric,
        'health_conditions': preExistingConditions,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  String get fName {
    var names = name.split(' ');
    return names.length > 1 ? names.first : names[0];
  }
}
