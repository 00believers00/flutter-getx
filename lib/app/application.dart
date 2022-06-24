import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'services/http_service.dart';
import 'services/localization_service.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
  @override
  void dependencies() {
    // Get.put(LocationService());
    Get.put(HttpService());
  }
}