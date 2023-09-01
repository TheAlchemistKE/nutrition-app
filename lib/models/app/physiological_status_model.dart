import 'dart:convert';

class PhysiologicalStatusModel {
  final int id;
  final String name;
  final bool isDefault;

  PhysiologicalStatusModel({
    required this.id,
    required this.name,
    required this.isDefault,
  });

  factory PhysiologicalStatusModel.fromJson(Map<String, dynamic> json) {
    return PhysiologicalStatusModel(
      id: json['id'],
      name: json['name'],
      isDefault: json['is_default'],
    );
  }

  factory PhysiologicalStatusModel.fromString(String source) {
    return PhysiologicalStatusModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'is_default': isDefault,
      };
}
