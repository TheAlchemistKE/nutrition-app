import 'dart:convert';

import 'package:nutrinowapp/api/api.dart';
import 'package:nutrinowapp/cache/storage_keys.dart';
import 'package:nutrinowapp/models/account/account_model.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';
import 'package:nutrinowapp/service/app_service.dart';

class ProfileService {
  static Future<ProfileModel?> fetchLocalDefaultProfile() async {
    // store profile locally as default
    var dp = await AppService.store.getString(StorageKeys.DEFAULT_PROFILE);
    if (dp != null) {
      return Future.value(ProfileModel.fromJson(jsonDecode(dp)));
    }
    return Future.value(null);
  }

  static Future<List<ProfileModel>> fetchAccountProfiles(AccountModel account) {
    return Future.value(List.empty());
  }

  static Future<ProfileModel> createNewProfile(ProfileModel profile) async {
    // Invoke insert profile API
    var resp = await Api.api().post('/profile', jsonEncode(profile));
    var p = ProfileModel.fromJson(resp);

    // store profile locally as default
    await AppService.store
        .saveString(StorageKeys.DEFAULT_PROFILE, jsonEncode(p));

    return Future.value(p);
  }

  static Future<ProfileModel> updateProfile(ProfileModel profile) async {
    // Invoke insert profile API
    var resp = await Api.api()
        .put('/profile/${profile.profileHash}', jsonEncode(profile));
    return Future.value(ProfileModel.fromJson(resp));
  }

  static Future<void> deleteProfile(ProfileModel profile) async {
    // Invoke insert profile API
    await Api.api().delete('/profile/${profile.profileHash}',
        query: {'uid': profile.accountHash});
    return null;
  }
}
