import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'interceptors/error_interceptor.dart';
import 'interceptors/jwt_interceptor.dart';

class HttpClient extends DioForNative {
  HttpClient([BaseOptions? options]) : super(options) {
    interceptors.addAll([
      JwtInterceptor(),
      ErrorInterceptor(),
    ]);
  }
}
