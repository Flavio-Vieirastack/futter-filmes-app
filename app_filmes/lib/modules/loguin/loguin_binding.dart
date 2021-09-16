import 'package:app_filmes/modules/loguin/Loguin_controller.dart';
import 'package:get/get.dart';

class LoguinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoguinController(loginServices: Get.find()));
  }
}
