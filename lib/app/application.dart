import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/services/config/flavor_service_variables.dart';
import 'data/services/flavor_service/flavor_service.dart';
import 'data/services/localization_service/localization_service.dart';
import 'data/services/todo_api_service/todos_api_service.dart';

import 'data/networks/config/http_client_config.dart';
import 'data/networks/http_client.dart';
import 'routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HttpClientConfig.setBaseUrl(FlavorService.getVariable(FlavorServiceVariables.baseUrl));
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.pages,
      initialBinding: RootBinding(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}

class RootBinding implements Bindings {
  final httpClient = HttpClient(HttpClientConfig.options);
  @override
  void dependencies() {
    Get.put(TodosApiService(httpClient));
  }
}