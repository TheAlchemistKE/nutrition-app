import 'dart:convert';

import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';

class RecommendationModel {
  final int id;
  final String title;
  final String description;
  final String nutritionRecommendation;
  final String lifestyleRecommendation;
  final bool isDefault;
  final String img;

  final HealthConditionModel healthConditionModel;

  RecommendationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.nutritionRecommendation,
    required this.lifestyleRecommendation,
    required this.isDefault,
    required this.img,
    required this.healthConditionModel,
  });

  factory RecommendationModel.empty() => RecommendationModel(
        id: 0,
        title: '',
        description: '',
        nutritionRecommendation: '',
        lifestyleRecommendation: '',
        isDefault: false,
        img: '',
        healthConditionModel: HealthConditionModel.empty(),
      );

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      nutritionRecommendation: json['nutrition_recommendation'],
      lifestyleRecommendation: json['lifestyle_recommendation'],
      isDefault: json['is_default'],
      img: json['img'],
      healthConditionModel:
          HealthConditionModel.fromJson(json['health_condition']),
    );
  }

  factory RecommendationModel.fromString(String source) {
    return RecommendationModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'nutrition_recommendation': nutritionRecommendation,
        'lifestyle_recommendation': lifestyleRecommendation,
        'is_default': isDefault,
        'img': img,
        'health_condition': healthConditionModel,
      };

  String get heroTag => '$id-$img';
}
