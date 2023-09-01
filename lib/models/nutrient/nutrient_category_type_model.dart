import 'dart:convert';

class NutrientCategoryTypeModel {
  final int id;
  final String name;
  final String description;

  const NutrientCategoryTypeModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory NutrientCategoryTypeModel.empty() {
    return NutrientCategoryTypeModel(id: 0, name: '', description: '');
  }

  factory NutrientCategoryTypeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NutrientCategoryTypeModel.empty();
    return NutrientCategoryTypeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  factory NutrientCategoryTypeModel.fromString(String source) {
    return NutrientCategoryTypeModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
