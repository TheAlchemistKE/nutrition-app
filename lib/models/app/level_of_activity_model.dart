import 'dart:convert';

class LevelOfActivityModel {
  final int id;
  final String name;
  final String description;
  final String briefDescription;
  final bool isDefault;

  LevelOfActivityModel({
    required this.id,
    required this.name,
    required this.description,
    required this.briefDescription,
    required this.isDefault,
  });

  factory LevelOfActivityModel.fromJson(Map<String, dynamic> json) {
    return LevelOfActivityModel(
      id: json['id'],
      briefDescription: json['brief_description'],
      name: json['name'],
      description: json['description'],
      isDefault: json['is_default'],
    );
  }

  factory LevelOfActivityModel.fromString(String source) {
    return LevelOfActivityModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'brief_description': briefDescription,
        'name': name,
        'description': description,
        'is_default': isDefault,
      };
}
