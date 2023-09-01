import 'package:nutrinowapp/models/errors/error_response.dart';

Map<int, ErrorResponse> errorResponses = {
  502: ErrorResponse(
    code: 502,
    msg: 'Service not reachable. Please try again later.',
    status: '',
  ),
  503: ErrorResponse(
    code: 503,
    msg: 'Service not reachable. Our developers are looking into this.',
    status: '',
  ),
  504: ErrorResponse(
    code: 504,
    msg: 'Server timeout. Our developers are looking into this.',
    status: '',
  ),
};

final genericErrorResponse = ErrorResponse(
  code: 500,
  msg: 'Server error. Please try again later.',
  status: '',
);

final genericUnexpectedErrorResponse = ErrorResponse(
  code: 500,
  msg: 'Encountered an unexpected error. Please try again.',
  status: '',
);
