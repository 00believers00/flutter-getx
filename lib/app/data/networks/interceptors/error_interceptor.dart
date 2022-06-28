import 'dart:developer';

import 'package:dio/dio.dart';

import '../exceptions/api_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final requestOptions = err.requestOptions;

    if (response == null) {
      return handler.reject(FetchDataException(
        requestOptions: requestOptions,
      ));
    }

    ApiException? apiException;

    switch (err.response!.statusCode) {
      case 400:
        apiException = BadRequestException(requestOptions: requestOptions);
        break;
      case 401:
        apiException = UnauthorizedException(requestOptions: requestOptions);
        break;
      case 403:
        apiException = ForbiddenException(requestOptions: requestOptions);
        break;
      default:
        apiException = FetchDataException(requestOptions: requestOptions);
    }

    log('API Exception: ${err.message}');
    return handler.reject(apiException);
  }
}
