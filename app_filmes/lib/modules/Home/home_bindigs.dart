import 'package:app_filmes/modules/Home/home_controller.dart';
import 'package:get/get.dart';

class HomeBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(loginServices: Get.find()), fenix: true);
  }
}
