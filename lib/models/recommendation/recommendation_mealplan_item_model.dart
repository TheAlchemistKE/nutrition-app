import 'dart:convert';

class RecommendationMealPlanItemModel {
  final int id;
  final String description;
  final double quantity;
  final String quantityMetric;
  final int parentId;

  RecommendationMealPlanItemModel(
      {required this.id,
      required this.description,
      required this.quantity,
      required this.quantityMetric,
      required this.parentId});

  factory RecommendationMealPlanItemModel.fromJson(Map<String, dynamic> json) {
    return RecommendationMealPlanItemModel(
      id: json['id'],
      description: json['description'],
      quantity: json['quantity'],
      quantityMetric: json['quantity_metric'],
      parentId: json['parent_id'],
    );
  }

  factory RecommendationMealPlanItemModel.fromString(String source) {
    return RecommendationMealPlanItemModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'quantity': quantity,
        'quantity_metric': quantityMetric,
        'parent_id': parentId,
      };
}
