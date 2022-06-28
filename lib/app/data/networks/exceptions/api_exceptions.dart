import 'package:dio/dio.dart';

class ApiException extends DioError {
  ApiException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}

class BadRequestException extends ApiException {
  BadRequestException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}

class ForbiddenException extends ApiException {
  ForbiddenException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}

class FetchDataException extends ApiException {
  FetchDataException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}
