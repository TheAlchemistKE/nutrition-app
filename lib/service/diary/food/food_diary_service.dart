import 'package:nutrinowapp/mock/food_diary_mealplan_data.dart';
import 'package:nutrinowapp/models/diary/food_diary_meal_plan_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class FoodDiaryService with AppService {
  static Future<List<FoodDiaryMealPlanModel>> fetchMealPlans() async {
    // TODO:
    return Future.value(foodDiaryMealPlansData);
  }
}
