import 'package:flutter/material.dart';
import 'package:nutrinowapp/models/profile/profile_model.dart';

extension ColorExtension on String {
  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    if (hexColor.length == 8) {
      var val = int.tryParse('0x$hexColor');
      if (val != null) return Color(val);
    }

    if (hexColor.startsWith('0x')) {
      var val = int.tryParse(hexColor);
      if (val != null) return Color(val);
    }
    return Colors.transparent;
  }
}

extension StringCaseTransform on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstOfEach => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.inCaps)
      .join(' ');

  String get firstChar => length > 0 ? this[0].toUpperCase() : '';
}

extension StringToProfileGenderExtension on String {
  ProfileGender get gender {
    switch (toLowerCase()) {
      case 'male':
        return ProfileGender.Male;
      case 'female':
        return ProfileGender.Female;
      case 'other':
        return ProfileGender.Other;
      case 'unknown':
        return ProfileGender.UnKnown;
      case 'prefernottosay':
      default:
        return ProfileGender.PreferNotToSay;
    }
  }
}

extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }
}

extension DoubleCheckExtension on double {
  bool get isZero => this == 0;
}

extension ProfileGenderExtension on ProfileGender {
  String get name {
    switch (this) {
      case ProfileGender.Male:
        return 'Male';
      case ProfileGender.Female:
        return 'Female';
      case ProfileGender.Other:
        return 'Other';
      case ProfileGender.UnKnown:
        return 'UnKnown';
      case ProfileGender.PreferNotToSay:
      default:
        return 'preferNotToSay';
    }
  }

  bool equal(ProfileGender p) => name == p.name;
}

extension ImageClearBgUrl on String {
  String get clearBg => substring(0, lastIndexOf('.')) + '-nobg.png';
}
