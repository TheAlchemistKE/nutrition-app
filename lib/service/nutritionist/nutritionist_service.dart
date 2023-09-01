import 'package:nutrinowapp/mock/nutritionist_data.dart';
import 'package:nutrinowapp/models/nutritionist/nutritionist_model.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class NutritionistService with AppService {
  static Future<List<NutritionistModel>> fetchProfileNutritionists(
      ProfileModel? defaultProfile) async {
    // TODO:
    return Future.value(nutritionistData);
  }
}
