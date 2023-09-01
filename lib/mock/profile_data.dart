import 'package:nutrinowapp/models/app/level_of_activity_model.dart';
import 'package:nutrinowapp/models/app/metric_model.dart';
import 'package:nutrinowapp/models/app/physiological_status_model.dart';
import 'package:nutrinowapp/models/healthcondition/health_condition_model.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';

var physiologicalStatusData = [
  PhysiologicalStatusModel(id: 1, name: 'None', isDefault: true),
  PhysiologicalStatusModel(id: 2, name: 'Pregnant', isDefault: false),
  PhysiologicalStatusModel(id: 3, name: 'Lactating', isDefault: false),
  PhysiologicalStatusModel(id: 4, name: 'Post menopausal', isDefault: false),
];

var levelOfActivityData = [
  LevelOfActivityModel(
      id: 1,
      name: 'Sedentary',
      description: 'description',
      briefDescription: '',
      isDefault: false),
  LevelOfActivityModel(
      id: 2,
      name: 'Sedentary1',
      description: 'description',
      briefDescription: '',
      isDefault: false),
  LevelOfActivityModel(
      id: 3,
      name: 'Sedentary2',
      description: 'description',
      briefDescription: '',
      isDefault: false),
  LevelOfActivityModel(
      id: 4,
      name: 'Sedentary3',
      description: 'description',
      briefDescription: '',
      isDefault: false),
  LevelOfActivityModel(
      id: 5,
      name: 'Sedentary4',
      description: 'description',
      briefDescription: '',
      isDefault: false),
];

var weightMetricData = [
  MetricModel(
    id: 1,
    value: 'Kg',
    groupId: 1,
    isBase: false,
    description: '',
    isDefault: true,
  ),
  MetricModel(
    id: 2,
    value: 'Pounds',
    groupId: 1,
    description: '',
    isBase: false,
  ),
  MetricModel(
    id: 3,
    value: 'Grams',
    groupId: 1,
    description: '',
    isBase: false,
  ),
];

var heightMetricData = [
  MetricModel(
    id: 1,
    value: 'Meter',
    groupId: 2,
    description: '',
    isBase: false,
  ),
  MetricModel(
    id: 2,
    value: 'Centimeter',
    groupId: 2,
    description: '',
    isBase: false,
    isDefault: true,
  ),
  MetricModel(
    id: 3,
    value: 'Kilometer',
    groupId: 2,
    description: '',
    isBase: false,
  ),
];

var preExistingConditionData = [
  ProfileHealthConditionModel(
    healthCondition: HealthConditionModel(
      healthConditionParentId: 0,
      id: 1,
      name: 'None',
      description: 'Description goes here',
      occurrenceVariation: '',
      isSignupDefault: false,
    ),
    id: 1,
    knownFamilyHistory: 'NO',
  ),
  ProfileHealthConditionModel(
    healthCondition: HealthConditionModel(
      healthConditionParentId: 0,
      id: 2,
      name: 'None 2',
      description: 'Description 2 goes here',
      occurrenceVariation: '',
      isSignupDefault: false,
    ),
    id: 2,
    knownFamilyHistory: 'Yes',
  )
];
