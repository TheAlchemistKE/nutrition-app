import 'package:nutrinowapp/mock/diaries_history_data.dart';
import 'package:nutrinowapp/models/diary/diary_kind_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_history_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_progress_summary_model.dart.dart';

class GenericDiaryService {
  static Future<List<GenericDiaryHistoryModel>> fetchHistory(
      DiaryKindModel diaryModel) async {
    // TODO:
    return Future.value(diaryHistoryData);
  }

  static Future<GenericDiaryProgressSummaryModel> fetchProgressSummary(
      DiaryKindModel diaryModel) async {
    // TODO:
    return Future.value(weightDiaryProgressSummaryData);
  }

  static Future<void> updateGenericProgressValue(
      DiaryKindModel diaryModel, double value) async {
    // TODO:
  }

  static Future<void> updateGenericProgressGoal(
      DiaryKindModel diaryModel, double value, String metric) async {
    // TODO:
  }
}
