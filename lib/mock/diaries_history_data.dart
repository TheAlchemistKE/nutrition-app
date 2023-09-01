import 'package:nutrinowapp/models/diary/generic_diary_history_model.dart';
import 'package:nutrinowapp/models/diary/generic_diary_progress_summary_model.dart.dart';

var diaryHistoryData = [
  GenericDiaryHistoryModel(
    value: 10,
    change: -1,
    metric: 'kg',
    dateTime: DateTime.now(),
    changeMetric: 'kg',
  ),
  GenericDiaryHistoryModel(
    value: 12,
    change: 2,
    metric: 'kg',
    dateTime: DateTime.now(),
    changeMetric: 'kg',
  ),
  GenericDiaryHistoryModel(
    value: 14,
    change: 2,
    metric: 'kg',
    dateTime: DateTime.now(),
    changeMetric: 'kg',
  ),
];

var weightDiaryProgressSummaryData = GenericDiaryProgressSummaryModel(
  goal: '65',
  goalMetric: 'Kg',
  current: '55',
  currentMetric: 'Kg',
);
