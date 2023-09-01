import 'dart:convert';

class FoodSearchFilterModel {
  List<int> categories;
  String searchText;

  FoodSearchFilterModel({this.categories = const [], this.searchText = ''});

  factory FoodSearchFilterModel.empty() {
    return FoodSearchFilterModel();
  }

  factory FoodSearchFilterModel.fromJson(Map<String, dynamic> json) =>
      FoodSearchFilterModel(
        categories: json['categories'],
        searchText: json['search_text'],
      );

  factory FoodSearchFilterModel.fromString(String source) {
    return FoodSearchFilterModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'categories': categories.map((e) => e.toString()),
        'search_text': searchText,
      };

  bool get isEmpty => categories.isEmpty && searchText.isEmpty;
}
