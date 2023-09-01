import 'dart:convert';

class NutrientSearchFilterModel {
  String searchText;

  NutrientSearchFilterModel({this.searchText = ''});

  factory NutrientSearchFilterModel.empty() {
    return NutrientSearchFilterModel();
  }

  factory NutrientSearchFilterModel.fromJson(Map<String, dynamic> json) =>
      NutrientSearchFilterModel(
        searchText: json['search_text'],
      );

  factory NutrientSearchFilterModel.fromString(String source) {
    return NutrientSearchFilterModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {'search_text': searchText};

  bool get isEmpty => searchText.isEmpty;
}
