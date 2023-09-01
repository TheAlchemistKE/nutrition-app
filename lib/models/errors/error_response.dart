import 'dart:convert';

import 'package:nutrinowapp/api/error-response.dart';

const DefaultStatusCode = 503;

class ErrorResponse {
  final String status;
  final int code;
  final String msg;

  ErrorResponse({required this.status, required this.code, required this.msg});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['status'],
      code: int.tryParse(json['code']) ?? DefaultStatusCode,
      msg: json['msg'],
    );
  }

  factory ErrorResponse.fromJsonString(String str) {
    try {
      Map<String, dynamic> j = json.decode(str);
      return ErrorResponse(
        status: j['status'],
        code: int.tryParse(j['code']) ?? DefaultStatusCode,
        msg: j['msg'],
      );
    } catch (e) {
      return genericErrorResponse;
    }
  }

  factory ErrorResponse.fromString(String source) {
    return ErrorResponse.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'code': code, 'msg': msg};
  }
}
