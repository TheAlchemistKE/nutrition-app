import 'dart:convert';

import 'package:nutrinowapp/models/recommendation/recommendation_model.dart';

class SuggestedRecommendationsModel {
  final int id;
  final String title;
  final int displayItemsCount;
  final List<RecommendationModel> items;

  SuggestedRecommendationsModel({
    required this.id,
    required this.title,
    required this.displayItemsCount,
    required this.items,
  });

  factory SuggestedRecommendationsModel.fromJson(Map<String, dynamic> json) {
    return SuggestedRecommendationsModel(
      id: json['id'],
      title: json['title'],
      displayItemsCount: json['display_items_count'],
      items: json['items'] != null
          ? (json['items'] as List)
              .map((i) => RecommendationModel.fromJson(i))
              .toList()
          : <RecommendationModel>[],
    );
  }

  factory SuggestedRecommendationsModel.fromString(String source) {
    return SuggestedRecommendationsModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'display_items_count': displayItemsCount,
        'items': items,
      };
}
