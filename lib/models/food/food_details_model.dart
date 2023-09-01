import 'dart:convert';

import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';

class FoodDetailsModel {
  final int id;
  final String name;
  final String categoryName;
  final String description;
  final String manufacture;
  final String comName;
  final String refDesc;
  final String sciName;
  final String img;
  final String thumbnail;
  final String healthBenefits;
  final String defaultMetric;
  final String defaultMetricAmount;

  final List<NutrientModel> macroNutrients;
  final List<NutrientModel> vitaminsMicroNutrients;
  final List<NutrientModel> mineralsMicroNutrients;

  FoodDetailsModel({
    required this.id,
    required this.name,
    categoryId,
    categoryName,
    comName,
    refDesc,
    sciName,
    img,
    thumbnail,
    healthBenefits,
    defaultMetric,
    defaultMetricAmount,
    description,
    manufactureName,
    this.macroNutrients = const [],
    this.vitaminsMicroNutrients = const [],
    this.mineralsMicroNutrients = const [],
  })  : manufacture = manufactureName ?? '',
        description = description ?? '',
        defaultMetric = defaultMetric ?? '',
        defaultMetricAmount = defaultMetricAmount ?? '',
        healthBenefits = healthBenefits ?? '',
        thumbnail = thumbnail ?? '',
        img = img ?? '',
        sciName = sciName ?? '',
        refDesc = refDesc ?? '',
        comName = comName ?? '',
        categoryName = categoryName ?? '';

  factory FoodDetailsModel.empty() {
    return FoodDetailsModel(
      id: 0,
      name: '',
      macroNutrients: [],
      vitaminsMicroNutrients: [],
      mineralsMicroNutrients: [],
    );
  }

  factory FoodDetailsModel.fromRdiFoodJson(Map<String, dynamic> json) =>
      json.containsKey('food')
          ? FoodDetailsModel.fromJson(json['food'])
          : FoodDetailsModel.empty();

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) =>
      FoodDetailsModel(
        id: json['id'],
        name: json['name'],
        categoryName: json['category_name'],
        description: json['description'],
        manufactureName: json['manufacturer_name'],
        macroNutrients: json['macroNutrients'] != null
            ? (json['macroNutrients'] as List)
                .map((i) => NutrientModel.fromJson(i))
                .toList()
            : [],
        vitaminsMicroNutrients: json['vitaminsMicroNutrients'] != null
            ? (json['vitaminsMicroNutrients'] as List)
                .map((i) => NutrientModel.fromJson(i))
                .toList()
            : [],
        mineralsMicroNutrients: json['mineralsMicroNutrients'] != null
            ? (json['mineralsMicroNutrients'] as List)
                .map((i) => NutrientModel.fromJson(i))
                .toList()
            : [],
        thumbnail: '',
      );

  factory FoodDetailsModel.fromString(String source) {
    return FoodDetailsModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'comName': comName,
        'refDesc': refDesc,
        'sciName': sciName,
        'img': img,
        'thumbnail': thumbnail,
        'healthBenefits': healthBenefits,
        'defaultMetric': defaultMetric,
        'defaultMetricAmount': defaultMetricAmount,
        'categoryName': categoryName,
        'description': description,
        'manufacturer_name': manufacture,
        'macroNutrients': macroNutrients,
        'mineralsMicroNutrients': mineralsMicroNutrients,
        'vitaminsMicroNutrients': vitaminsMicroNutrients,
      };

  NutrientModel getMacroNutrient(String name) =>
      macroNutrients.singleWhere((e) => e.name == name);

  NutrientModel getMicroNutrient(String name) =>
      macroNutrients.singleWhere((e) => e.name == name);

  String get cleanDescription {
    if (description.isEmpty) {
      var i = name.indexOf(',');
      if (i != -1) return name.substring(i + 1).trim();
    }
    return description;
  }

  String get cleanName {
    if (description.isEmpty) {
      var i = name.indexOf(',');
      if (i != -1) return name.substring(0, i).trim();
    }
    return name;
  }
}
