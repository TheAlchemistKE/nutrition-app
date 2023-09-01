import 'package:nutrinowapp/api/api-wrapper.dart';

const String InvalidToken = 'INVALID_TOKEN';

const Map<String, dynamic> defaultHeaders = {
  'content-type': 'application/json'
};

class Api {
  static const String _baseUrl = 'dev.api.nutrinow.co';

  static ApiWrapper api({String prefix = '', Map<String, dynamic>? headers}) {
    var allHeaders = <String, String>{...defaultHeaders, ...?headers};
    return ApiWrapper(_baseUrl, version: 'v1/' + prefix, headers: allHeaders);
  }
}
