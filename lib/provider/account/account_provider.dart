import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';

class AccountProvider extends ChangeNotifier {
  late String _accountHash;
  ProfileModel? _defaultProfile;

  final List<ProfileModel> _profiles = List.empty(growable: true);

  String get accountHash => _accountHash;

  set accountHash(String accountHash) {
    _accountHash = _accountHash;
    notifyListeners();
  }

  ProfileModel? get defaultProfile => _defaultProfile;

  set defaultProfile(ProfileModel? profile) {
    if (profile != null && isDefaultProfile(profile)) return;

    _defaultProfile = profile;
    if (profile != null && !hasProfile(profile)) {
      _profiles.add(profile);
    }
    notifyListeners();
  }

  List<ProfileModel> get profiles => _profiles;

  set profiles(List<ProfileModel> profiles) {
    for (var profile in profiles) {
      if (hasProfile(profile)) {
        continue;
      }
      _profiles.add(profile);
    }
    notifyListeners();
  }

  set profile(ProfileModel profile) {
    if (hasProfile(profile)) {
      return;
    }
    _profiles.add(profile);
    notifyListeners();
  }

  void removeProfile(ProfileModel profile) {
    if (_profiles.length <= 1) return;

    for (var i = 0; i < _profiles.length; i++) {
      if (_profiles[i].profileHash == profile.profileHash) {
        _profiles.removeAt(i);

        if (isDefaultProfile(profile)) {
          defaultProfile = _profiles[0];
        }
        break;
      }
    }
    notifyListeners();
  }

  bool hasProfile(ProfileModel profile) {
    return _profiles
        .where((elem) => elem.profileHash == profile.profileHash)
        .isNotEmpty;
  }

  bool isDefaultProfile(ProfileModel profile) {
    if (defaultProfile == null) {
      return false;
    }
    return defaultProfile!.profileHash == profile.profileHash;
  }
}
