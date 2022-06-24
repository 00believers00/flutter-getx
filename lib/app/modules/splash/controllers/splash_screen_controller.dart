import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/http_service.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    _delayTime();
    _initService();
    super.onInit();
  }

  void _initService(){
    final httpService = Get.find<HttpService>();
    httpService.init();
  }

  void _delayTime(){
    Future.delayed(const Duration(seconds: 2),(){

      Get.offAndToNamed(AppRoutes.dashboard);
    });
  }

}
