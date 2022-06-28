import 'package:dio/dio.dart';

class HttpClientConfig {

  static String _baseUrl = "";
  static void setBaseUrl(String url){
    _baseUrl = url;
  }

  static final options = BaseOptions(
    baseUrl: _baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    sendTimeout: 30000,
    receiveTimeout: 30000,
  );
}
