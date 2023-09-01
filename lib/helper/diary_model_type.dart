import 'package:nutrinowapp/models/diary/diary_kind_model.dart';

class DiaryModelTypeHelper {
  static DiaryKindModelType fromString(String type) {
    print('${DiaryKindModelType.values}');
    return DiaryKindModelType.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == type.toUpperCase(),
      orElse: () => DiaryKindModelType.generic,
    );
  }
}
