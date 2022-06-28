import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class JwtInterceptor extends Interceptor {
  final _sharedPreferences = EncryptedSharedPreferences();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final jwt = await _sharedPreferences.getString('jwt');
    options.headers.addAll({"Authorization": "Bearer $jwt"});
    super.onRequest(options, handler);
  }
}
