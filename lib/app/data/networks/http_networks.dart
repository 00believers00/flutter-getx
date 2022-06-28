import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart' as GetX;



class HttpNetworks{
  final Dio dio = Dio();
  String baseUrl = "";
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
    options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjAwYmVsaWV2ZXJzMDAiLCJzdWIiOiIwMDk5MTIzMTI3NDEyOTAiLCJpYXQiOjE2NTYzNDY5MjYsImV4cCI6MTY1NjM0Njk4Nn0.WjF1hphRdXlIw5N4_pVcoHFdMpGf8sKPYW2df1rD5-4";
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
    debugPrint('ERROR[${err.type}] => PATH: ${err.requestOptions.path}');

    switch(err.type){
      case DioErrorType.response:
        debugPrint('ERROR CODE[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
        GetX.Get.defaultDialog(title: "ERROR ${err.response?.statusCode}", content: Text(err.response!.data["message"]));
        break;
      case DioErrorType.connectTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.sendTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.receiveTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.cancel:
        // TODO: Handle this case.
        break;
      case DioErrorType.other:
        // TODO: Handle this case.
        break;
    }
    return ;
  }
}