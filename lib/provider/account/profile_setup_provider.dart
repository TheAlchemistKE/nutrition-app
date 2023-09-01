import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrinowapp/helper/hash.dart';
import 'package:nutrinowapp/models/profile/profile_health_condition_model.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';

class ProfileSetupProvider extends ChangeNotifier {
  String _profileHash;
  String _accountHash;
  String _name = '';
  DateTime? _dob;
  String _location = '';
  int _physiologicalStatusId = 0;
  ProfileGender _gender = ProfileGender.UnKnown;
  num _weight = 0;
  String _weightMetric = '';
  num _height = 0;
  String _heightMetric = '';
  int _levelOfActivityId = 0;
  List<ProfileHealthConditionModel> _preExistingConditions = [];

  ProfileSetupProvider(String accountHash, {String? profileHash})
      : _profileHash = profileHash ?? hash(),
        _accountHash = accountHash;

  String get profileHash => _profileHash;

  set profileHash(String profileHash) {
    _profileHash = profileHash;
    notifyListeners();
  }

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  DateTime? get dob => _dob;

  String get dobFormatted {
    if (_dob == null) return '';
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(_dob!);
  }

  set dob(DateTime? dob) {
    _dob = dob;
    notifyListeners();
  }

  String get location => _location;

  set location(String location) {
    _location = location;
    notifyListeners();
  }

  int get physiologicalStatusId => _physiologicalStatusId;

  set physiologicalStatusId(int physiologicalStatusId) {
    _physiologicalStatusId = physiologicalStatusId;
    notifyListeners();
  }

  ProfileGender get gender => _gender;

  set gender(ProfileGender gender) {
    _gender = gender;
    notifyListeners();
  }

  num get weight => _weight;

  set weight(num weight) {
    _weight = weight;
    notifyListeners();
  }

  String get weightMetric => _weightMetric;

  set weightMetric(String weightMetric) {
    _weightMetric = weightMetric;
    notifyListeners();
  }

  num get height => _height;

  set height(num weight) {
    _height = weight;
    notifyListeners();
  }

  String get heightMetric => _heightMetric;

  set heightMetric(String heightMetric) {
    _heightMetric = heightMetric;
    notifyListeners();
  }

  int get levelOfActivityId => _levelOfActivityId;

  set levelOfActivityId(int levelOfActivityId) {
    _levelOfActivityId = levelOfActivityId;
    notifyListeners();
  }

  List<ProfileHealthConditionModel> get preExistingConditions =>
      _preExistingConditions;

  set preExistingConditions(
      List<ProfileHealthConditionModel> preExistingConditionIds) {
    _preExistingConditions = preExistingConditionIds;
    notifyListeners();
  }

  set preExistingCondition(ProfileHealthConditionModel preExistingCondition) {
    if (_preExistingConditions
        .where((element) =>
            element.healthCondition.id ==
            preExistingCondition.healthCondition.id)
        .isNotEmpty) {
      return;
    }

    _preExistingConditions.add(preExistingCondition);
    notifyListeners();
  }

  ProfileModel get profileModel => ProfileModel(
        profileHash: _profileHash.isEmpty ? hash() : _profileHash,
        accountHash: _accountHash,
        name: _name,
        dob: _dob ?? DateTime.now().add(Duration(days: 10)),
        location: _location,
        physiologicalStatusId: _physiologicalStatusId,
        gender: _gender,
        weight: _weight,
        weightMetric: _weightMetric,
        height: _height,
        heightMetric: _heightMetric,
        levelOfActivityId: _levelOfActivityId,
        preExistingConditions: _preExistingConditions,
      );

  set profileModel(ProfileModel profile) {
    _profileHash = profile.profileHash;
    _accountHash = profile.accountHash;
    _name = profile.name;
    _dob = profile.dob;
    _location = profile.location;
    _physiologicalStatusId = profile.physiologicalStatusId;
    _gender = profile.gender;
    _weight = profile.weight;
    _weightMetric = profile.weightMetric;
    _height = profile.height;
    _heightMetric = profile.heightMetric;
    _levelOfActivityId = profile.levelOfActivityId;
    _preExistingConditions = profile.preExistingConditions;

    notifyListeners();
  }

  void clear() {
    _profileHash = '';
    _name = '';
    _dob = null;
    _location = '';
    _physiologicalStatusId = 0;
    _gender = ProfileGender.UnKnown;
    _weight = 0;
    _weightMetric = '';
    _height = 0;
    _heightMetric = '';
    _levelOfActivityId = 0;
    _preExistingConditions = [];

    notifyListeners();
  }

  void debug() {
    print('Profile Details $profileModel');
  }
}
