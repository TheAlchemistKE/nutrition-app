import 'package:nutrinowapp/mock/diaries_data.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class DiaryCategoryService with AppService {
  static Future<List<DiaryKindModel>> fetchDiaryCategories(
      ProfileModel? defaultProfile) async {
    // TODO:
    return Future.value(diariesData);
  }
}
