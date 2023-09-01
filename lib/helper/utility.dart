import 'package:http_parser/http_parser.dart';

T? firstWhere<T>(List<T> items, bool Function(T element) test,
    {T Function()? orElse}) {
  for (var element in items) {
    if (test(element)) return element;
  }
  if (orElse != null) return orElse();
}

MediaType contentTypeForHeaders(Map<String, String> headers) {
  var contentType = headers['content-type'];
  if (contentType != null) return MediaType.parse(contentType);
  return MediaType('application', 'octet-stream');
}
