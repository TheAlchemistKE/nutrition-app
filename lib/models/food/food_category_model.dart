import 'dart:convert';

class FoodCategoryModel {
  final int id;
  final String name;
  final String displayName;
  final String img;
  final String description;

  FoodCategoryModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.img,
    required this.description,
  });

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      img: json['img'],
      description: json['description'],
    );
  }

  factory FoodCategoryModel.fromString(String source) {
    return FoodCategoryModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'img': img,
      'description': description,
    };
  }
}
