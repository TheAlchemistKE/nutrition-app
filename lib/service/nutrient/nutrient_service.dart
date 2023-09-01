import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/models/food/food_details_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_category_model.dart';
import 'package:nutrinowapp/models/nutrient/nutrient_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class NutrientService with AppService {
  static Future<List<NutrientCategoryModel>> fetchNutrientCategories() async {
    var resp = await Api.api().get('/nutrient-category');
    var nutrientCats = <NutrientCategoryModel>[];
    resp.forEach((i) => nutrientCats.add(NutrientCategoryModel.fromJson(i)));
    return Future.value(nutrientCats);
  }

  static Future<List<FoodDetailsModel>> fetchNutrientFoods(
      NutrientModel nutrient) async {
    var resp = await Api.api().get('/nutrient/${nutrient.id}/food');
    var nutrientFoods = <FoodDetailsModel>[];
    resp.forEach((i) => nutrientFoods.add(FoodDetailsModel.fromRdiFoodJson(i)));
    return nutrientFoods;
  }

  static Future<List<NutrientModel>> searchNutrient(
      Map<String, dynamic>? query) async {
    var resp = await Api.api().get('/nutrient', query: query);
    var nutrients = <NutrientModel>[];
    resp.forEach((i) => nutrients.add(NutrientModel.fromJson(i)));
    return nutrients;
  }

  static Future<List<FoodDetailsModel>> fetchNutrientCategoryFoods(
      NutrientCategoryModel category) async {
    var resp = await Api.api().get('/nutrient-category/${category.id}/food');
    var nutrientFoods = <FoodDetailsModel>[];
    resp.forEach((i) => nutrientFoods.add(FoodDetailsModel.fromRdiFoodJson(i)));
    return nutrientFoods;
  }

  static Future<List<NutrientModel>> fetchNutrientCategoryNutrients(
      NutrientCategoryModel cat) async {
    var resp = await Api.api().get('/nutrient-category/${cat.id}/nutrients');
    var nutrients = <NutrientModel>[];
    resp.forEach((i) => nutrients.add(NutrientModel.fromJson(i)));
    return nutrients;
  }
}
