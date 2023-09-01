import 'dart:convert';

import 'package:nutrinowapp/models/profile/profile_model.dart';

class AccountModel {
  late int id;
  late String hash;
  late String pNum;

  late List<ProfileModel> profiles = [];

  AccountModel({required id, required hash, required pNum}) {
    id = id;
    hash = hash;
    pNum = pNum;
  }

  factory AccountModel.empty() => AccountModel(id: 0, hash: '', pNum: '');

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'],
      hash: json['account_hash'],
      pNum: json['phone_number'] ?? '');

  factory AccountModel.fromString(String source) {
    return AccountModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account_hash': hash,
        'phone_number': pNum,
      };

  void addProfile(ProfileModel profileModel) {
    profiles.add(profileModel);
  }

  void removeProfile(ProfileModel profileModel) {
    profiles.remove(profileModel);
  }
}
