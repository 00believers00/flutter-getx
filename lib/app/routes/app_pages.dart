import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_views.dart';
import '../modules/splash/bindings/splash_screen_binding.dart';
import '../modules/splash/views/splash_screen_view.dart';
 part 'app_routes.dart';

abstract class AppPages{
  static final pages = [
    GetPage(
        name: AppRoutes.splashscreen,
        page: () => const SplashScreenView(),
        binding: SplashScreenBinding()
    ),
    GetPage(
        name: AppRoutes.dashboard,
        page: ()=> const DashboardView(),
        binding: DashboardBinding()
    ),
    GetPage(
        name: AppRoutes.settings,
        page: ()=> const SettingsView(),
        binding: SettingsBinding()
    )
  ];
}