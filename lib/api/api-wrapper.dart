import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nutrinowapp/api/error-response.dart';
import 'package:nutrinowapp/constants/content-type.dart';
import 'package:nutrinowapp/helper/utility.dart';
import 'package:nutrinowapp/models/errors/error_response.dart';

class APIException implements Exception {
  final String message;

  int httpCode;
  String status;

  APIException(this.message, {required this.httpCode, required this.status});

  factory APIException.fromErrorResponse(ErrorResponse err) {
    return APIException(err.msg, httpCode: err.code, status: err.status);
  }

  @override
  String toString() => message;
}

class ApiWrapper {
  final String baseUrl;

  final String version;

  final Map<String, String> headers;

  ApiWrapper(this.baseUrl, {this.version = '', required this.headers});

  Uri uri({String path = '', Map<String, dynamic>? query, String? queryStr}) {
    var p = version.trim();
    path = path.trim();

    if (version != '') {
      p = p.endsWith('/') ? p : p + '/';
    }

    if (path != '') {
      if (p.endsWith('/') && path.startsWith('/')) {
        path = path.substring(1, path.length);
      } else if (!p.endsWith('/') && !path.startsWith('/')) {
        path = '/' + path;
      }
    }

    return Uri(
      scheme: 'https',
      host: baseUrl,
      path: '/api/' + p + path,
      queryParameters: query,
      query: queryStr,
    );
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(
      await http.get(
        uri(path: path, query: query, queryStr: queryStr),
        headers: headers,
      ),
    );
  }

  Future<dynamic> put(String path, dynamic data,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(
      await http.put(
        uri(path: path, query: query, queryStr: queryStr),
        headers: headers,
        body: data,
      ),
    );
  }

  Future<dynamic> post(String path, dynamic data,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(
      await http.post(
        uri(path: path, query: query, queryStr: queryStr),
        headers: headers,
        body: data,
      ),
    );
  }

  Future<dynamic> delete(String path,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(
      await http.delete(
        uri(path: path, query: query, queryStr: queryStr),
        headers: headers,
      ),
    );
  }

  Future<dynamic> patch(String path, dynamic data,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(
      await http.patch(
        uri(path: path, query: query, queryStr: queryStr),
        headers: headers,
        body: data,
      ),
    );
  }

  Future<dynamic> head(String path,
      {Map<String, dynamic>? query, String? queryStr}) async {
    return _parseResponse(await http.head(
      uri(path: path, query: query, queryStr: queryStr),
      headers: headers,
    ));
  }

  dynamic _parseResponse(http.Response res) {
    print('Response: ${res.body}, Status code: ${res.statusCode}');
    if (res.statusCode == 200) {
      var mimeType = contentTypeForHeaders(res.headers).mimeType;
      switch (mimeType) {
        case ContentType.TextHtml:
          return res.body;
        case ContentType.ApplicationJson:
        default:
          return json.decode(res.body);
      }
    }

    if (res.statusCode == 204) {
      return {};
    }

    if ((res.statusCode >= 400 && res.statusCode < 450) ||
        res.statusCode == 500) {
      var errResp = ErrorResponse.fromJsonString(res.body);
      throw APIException.fromErrorResponse(errResp);
    }

    var errorResponse = errorResponses[res.statusCode];
    throw APIException.fromErrorResponse(
        errorResponse ?? genericUnexpectedErrorResponse);
  }
}
