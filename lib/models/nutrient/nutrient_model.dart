import 'dart:convert';

import 'package:nutrinowapp/constants/strings.dart';

class NutrientModel {
  final int id;
  final String name;

  final String otherNames;
  final String description;
  final String detailedDescription;
  final String belowLevelImpact;
  final String aboveLevelImpact;

  final String amount;
  final String amountMetric;

  final String ll;
  final String llMetric;

  final String rdi;
  final String rdiMetric;

  final String ul;
  final String ulMetric;

  final String bgColor;
  final String fgColor;

  final String foodDescription;

  final String specialConsiderations;

  NutrientModel({
    required this.id,
    this.otherNames = '',
    this.description = '',
    this.detailedDescription = '',
    this.belowLevelImpact = '',
    this.aboveLevelImpact = '',
    required this.name,
    String? ll,
    String? llMetric,
    String? amount,
    String? amountMetric,
    String? rdi,
    String? rdiMetric,
    String? ul,
    String? ulMetric,
    String? foodDescription,
    required this.bgColor,
    required this.fgColor,
    this.specialConsiderations = '',
  })  : rdi = rdi ?? '',
        rdiMetric = rdiMetric ?? '',
        ul = ul ?? '',
        ulMetric = ulMetric ?? '',
        amount = amount ?? '',
        amountMetric = amountMetric ?? '',
        ll = ll ?? '',
        llMetric = llMetric ?? '',
        foodDescription = foodDescription ?? '';

  factory NutrientModel.fromJson(Map<String, dynamic> json) => NutrientModel(
        id: json['id'],
        description: json['description'] ?? '',
        name: json['nutrition_desc'],
        otherNames: json['other_names'] ?? '',
        detailedDescription: json['detailed_description'] ?? '',
        belowLevelImpact: json['below_level_impact'] ?? '',
        aboveLevelImpact: json['above_level_impact'] ?? '',
        specialConsiderations: json['special_considerations'] ?? '',
        ll: json['ll'] ?? '',
        llMetric: json['llMetric'] ?? '',
        amount: json['amount'] ?? '',
        amountMetric: json['amount_metric'] ?? '',
        rdi: json['recommend_intake_amount'] ?? '',
        rdiMetric: json['recommend_intake_amount_metric'] ?? '',
        ul: json['recommend_upper_limit_amount'] ?? '',
        ulMetric: json['recommend_upper_limit_metric'] ?? '',
        bgColor: json['bg_color'] ?? '',
        fgColor: json['fg_color'] ?? '',
        foodDescription: json['food_description'],
      );

  factory NutrientModel.fromString(String source) {
    return NutrientModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'other_names': otherNames,
        'detailed_description': detailedDescription,
        'below_level_impact': belowLevelImpact,
        'above_level_impact': aboveLevelImpact,
        'special_considerations': specialConsiderations,
        'nutrition_desc': name,
        'll': ll,
        'llMetric': llMetric,
        'amount': amount,
        'amount_metric': amountMetric,
        'recommend_intake_amount': rdi,
        'recommend_intake_amount_metric': rdiMetric,
        'recommend_upper_limit_amount': ul,
        'recommend_upper_limit_metric': ulMetric,
        'description': description,
        'bg_color': bgColor,
        'fg_color': fgColor,
        'food_description': foodDescription,
      };

  String get llAmount =>
      ll.isEmpty || llMetric.isEmpty ? NotAvailable : '$ll $llMetric';

  String get rdiAmount =>
      rdi.isEmpty || rdiMetric.isEmpty ? NotAvailable : '$rdi $rdiMetric';

  String get ulAmount =>
      ul.isEmpty || ulMetric.isEmpty ? NotAvailable : '$ul $ulMetric';

  String get actualAmount => amount.isEmpty || amountMetric.isEmpty
      ? NotAvailable
      : '$amount $amountMetric';

  List<String> get foodItems =>
      foodDescription.split(',').map((e) => e.trim()).toList();
}
