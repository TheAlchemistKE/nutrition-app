import 'dart:convert';

class StorageMetaData {
  final DateTime createdAt;
  final DateTime lastViewed;
  final dynamic data;

  StorageMetaData({
    required this.createdAt,
    required this.lastViewed,
    required this.data,
  });

  factory StorageMetaData.fromJson(Map<String, dynamic> json) {
    return StorageMetaData(
      createdAt: json['c'],
      lastViewed: json['l'],
      data: json['data'],
    );
  }

  factory StorageMetaData.fromString(String source) {
    return StorageMetaData.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'c': createdAt,
        'l': lastViewed,
        'data': data,
      };
}
