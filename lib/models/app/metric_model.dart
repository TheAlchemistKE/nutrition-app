import 'dart:convert';

class MetricModel {
  final int id;
  final String value;
  final String description;
  final bool isBase;
  final bool isDefault;
  final int groupId;

  MetricModel({
    required this.id,
    required this.value,
    required this.description,
    required this.isBase,
    required this.groupId,
    this.isDefault = false,
  });

  factory MetricModel.fromJson(Map<String, dynamic> json) {
    return MetricModel(
      id: json['id'],
      value: json['name'],
      description: json['description'],
      isBase: json['is_base'],
      groupId: json['group_id'],
      isDefault: json['is_default'],
    );
  }

  factory MetricModel.fromString(String source) {
    return MetricModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': value,
        'description': description,
        'is_base': isBase,
        'group_id': groupId,
        'is_default': isDefault,
      };
}
