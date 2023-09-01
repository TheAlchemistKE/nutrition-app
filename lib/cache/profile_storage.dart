import 'dart:convert';

import 'package:nutrinowapp/cache/storage_keys.dart';
import 'package:nutrinowapp/models/app/level_of_activity_model.dart';
import 'package:nutrinowapp/models/app/physiological_status_model.dart';
import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class ProfileStorage {
  static Future<List<PhysiologicalStatusModel>> getPhysiologicalStatus() async {
    var physiologicalStatus = <PhysiologicalStatusModel>[];

    var dp = await AppService.store
        .getString(StorageKeys.PROFILE_PHYSIOLOGICAL_STATUS);
    if (dp != null) {
      List<dynamic> resp = jsonDecode(dp);
      resp.forEach(
          (i) => physiologicalStatus.add(PhysiologicalStatusModel.fromJson(i)));
      return physiologicalStatus;
    }
    return List.empty();
  }

  static void savePhysiologicalStatus(
      List<PhysiologicalStatusModel> data) async {
    await AppService.store
        .saveString(StorageKeys.PROFILE_PHYSIOLOGICAL_STATUS, jsonEncode(data));
  }

  static Future<List<LevelOfActivityModel>> getLevelOfActivity() async {
    var levelOfActivity = <LevelOfActivityModel>[];

    var dp =
        await AppService.store.getString(StorageKeys.PROFILE_LEVEL_OF_ACTIVITY);
    if (dp != null) {
      List<dynamic> resp = jsonDecode(dp);
      resp.forEach(
          (i) => levelOfActivity.add(LevelOfActivityModel.fromJson(i)));
      return levelOfActivity;
    }
    return List.empty();
  }

  static void saveLevelOfActivity(List<LevelOfActivityModel> data) async {
    await AppService.store
        .saveString(StorageKeys.PROFILE_LEVEL_OF_ACTIVITY, jsonEncode(data));
  }

  static Future<List<HealthConditionModel>> getHealthCondition() async {
    var healthConditions = <HealthConditionModel>[];

    var dp = await AppService.store.getString(StorageKeys.HEALTH_CONDITION);
    if (dp != null) {
      List<dynamic> resp = jsonDecode(dp);
      resp.forEach(
          (i) => healthConditions.add(HealthConditionModel.fromJson(i)));
      return healthConditions;
    }
    return List.empty();
  }

  static void saveHealthCondition(List<HealthConditionModel> data) async {
    await AppService.store
        .saveString(StorageKeys.HEALTH_CONDITION, jsonEncode(data));
  }
}
