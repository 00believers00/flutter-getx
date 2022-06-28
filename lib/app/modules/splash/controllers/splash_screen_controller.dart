import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../data/networks/http_networks.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    _delayTime();
    _initService();
    super.onInit();
  }

  void _initService(){
    // final httpNetworks = Get.find<HttpNetworks>();
    // httpNetworks.init();
  }

  void _delayTime(){
    Future.delayed(const Duration(seconds: 2),(){

      Get.offAndToNamed(AppRoutes.dashboard);
    });
  }

}
