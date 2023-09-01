import 'dart:convert';

import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';

class ProfileRecommendationModel {
  final int id;
  final String description;
  final String subscribedAt;
  final RecommendationModel recommendation;

  ProfileRecommendationModel({
    required this.id,
    required this.description,
    required this.subscribedAt,
    required this.recommendation,
  });

  factory ProfileRecommendationModel.empty() => ProfileRecommendationModel(
        id: 0,
        description: '',
        recommendation: RecommendationModel.empty(),
        subscribedAt: '',
      );

  factory ProfileRecommendationModel.fromJson(Map<String, dynamic> json) {
    return ProfileRecommendationModel(
      id: json['id'],
      description: json['description'],
      subscribedAt: json['subscribed_at'] ?? DateTime(2021),
      recommendation: RecommendationModel.fromJson(json['recommendation']),
    );
  }

  factory ProfileRecommendationModel.fromString(String source) {
    return ProfileRecommendationModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'subscribed_at': subscribedAt,
        'recommendation': recommendation,
      };
}
