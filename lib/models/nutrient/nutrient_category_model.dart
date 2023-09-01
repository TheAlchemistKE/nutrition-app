import 'dart:convert';

import 'package:nutrinowapp/models/nutrient/nutrient_category_type_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';

class NutrientCategoryModel {
  final int id;
  final String name;
  final String description;
  final int displayOrder;
  final String briefDescription;
  final String belowLevelImpact;
  final String aboveLevelImpact;
  final String foodsDescription;

  final NutrientCategoryTypeModel categoryType;

  final String dailyIntake;
  final String img;

  final String note;

  final List<NutrientModel> nutrients;

  const NutrientCategoryModel({
    required this.id,
    required this.name,
    required this.categoryType,
    this.description = '',
    this.displayOrder = 0,
    this.briefDescription = '',
    this.belowLevelImpact = '',
    this.aboveLevelImpact = '',
    this.foodsDescription = '',
    this.img = '',
    this.dailyIntake = '',
    this.note = '',
    this.nutrients = const [],
  });

  factory NutrientCategoryModel.empty() => NutrientCategoryModel(
        id: 0,
        name: '',
        categoryType: NutrientCategoryTypeModel.empty(),
      );

  factory NutrientCategoryModel.fromJson(Map<String, dynamic> json) =>
      NutrientCategoryModel(
          id: json['id'],
          name: json['name'],
          displayOrder: json['display_order'] ?? 0,
          description: json['description'] ?? '',
          briefDescription: json['brief_description'] ?? '',
          belowLevelImpact: json['below_level_impact'] ?? '',
          aboveLevelImpact: json['above_level_impact'] ?? '',
          foodsDescription: json['foods_description'] ?? '',
          categoryType:
              NutrientCategoryTypeModel.fromJson(json['category_type']),
          img: json['img'] ?? '',
          dailyIntake: json['daily_intake'] ?? '',
          note: json['note'] ?? '',
          nutrients: json['nutrients'] != null
              ? (json['nutrients'] as List)
                  .map((i) => NutrientModel.fromJson(i))
                  .toList()
              : []);

  factory NutrientCategoryModel.fromString(String source) {
    return NutrientCategoryModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'display_order': displayOrder,
        'description': description,
        'brief_description': briefDescription,
        'below_level_impact': belowLevelImpact,
        'above_level_impact': aboveLevelImpact,
        'foods_description': foodsDescription,
        'img': img,
        'daily_intake': dailyIntake,
        'note': note,
        'nutrients': nutrients
      };

  List<String> get foodItems => foodsDescription.split(',');
}
