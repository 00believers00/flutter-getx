import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HttpService{
  final Dio dio = Dio();

  void init(){
    dio.interceptors.add(_LogInterceptors(responseBody: false));
  }

}


class _LogInterceptors extends Interceptor {
  _LogInterceptors({this.responseBody = true});
  final bool responseBody;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    if(responseBody){
      debugPrint('BODY: ${response.data}');
    }
    return super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}