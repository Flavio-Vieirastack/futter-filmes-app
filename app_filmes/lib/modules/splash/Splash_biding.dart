import 'package:app_filmes/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
