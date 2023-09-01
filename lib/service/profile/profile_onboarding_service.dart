import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/cache/profile_storage.dart';
import 'package:nutrinowapp/helper/utility.dart';
import 'package:nutrinowapp/mock/profile_data.dart';
import 'package:nutrinowapp/models/app/level_of_activity_model.dart';
import 'package:nutrinowapp/models/app/metric_model.dart';
import 'package:nutrinowapp/models/app/physiological_status_model.dart';
import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';

mixin ProfileOnBoardingService {
  static Future<List<PhysiologicalStatusModel>> getPhysiologicalStatus() async {
    var resp = await ProfileStorage.getPhysiologicalStatus();
    if (resp.isNotEmpty) return resp;

    var physiologicalStatus = <PhysiologicalStatusModel>[];
    var apiResp = await Api.api().get('/physiological-status');
    apiResp.forEach(
        (i) => physiologicalStatus.add(PhysiologicalStatusModel.fromJson(i)));
    ProfileStorage.savePhysiologicalStatus(physiologicalStatus);
    return physiologicalStatus;
  }

  static Future<List<MetricModel>> fetchHeightMetric() async {
    // TODO:
    return heightMetricData;
  }

  static Future<List<MetricModel>> fetchWeightMetric() async {
    // TODO:
    return weightMetricData;
  }

  static MetricModel? fetchDefaultMetric(List<MetricModel> items,
      {String? pick}) {
    return firstWhere(
      items,
      (elem) {
        if (pick == null) return elem.isDefault;
        return elem.value.toLowerCase() == pick.toLowerCase();
      },
    );
  }

  static Future<List<LevelOfActivityModel>> fetchLevelOfActivity() async {
    var resp = await ProfileStorage.getLevelOfActivity();
    if (resp.isNotEmpty) return resp;

    var levelOfActivity = <LevelOfActivityModel>[];
    var apiResp = await Api.api().get('/level-of-activity');
    apiResp
        .forEach((i) => levelOfActivity.add(LevelOfActivityModel.fromJson(i)));
    ProfileStorage.saveLevelOfActivity(levelOfActivity);
    return levelOfActivity;
  }

  static Future<List<HealthConditionModel>> fetchHealthConditions() async {
    // var resp = await ProfileStorage.getHealthCondition();
    // if (resp.isNotEmpty) return resp;

    var healthCondition = <HealthConditionModel>[];
    var apiResp = await Api.api().get('/health-condition');
    apiResp
        .forEach((i) => healthCondition.add(HealthConditionModel.fromJson(i)));
    // ProfileStorage.saveHealthCondition(healthCondition);
    return healthCondition;
  }

  static Future<List<ProfileHealthConditionModel>> fetchProfileHealthConditions(
      ProfileModel profile) async {
    var cond = <ProfileHealthConditionModel>[];
    var apiResp =
        await Api.api().get('/profile/${profile.profileHash}/health-condition');
    apiResp.forEach((i) => cond.add(ProfileHealthConditionModel.fromJson(i)));
    return cond;
  }
}
