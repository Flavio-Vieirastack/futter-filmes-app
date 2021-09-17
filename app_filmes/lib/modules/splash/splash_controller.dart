import 'package:app_filmes/application/auth/auth_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  
  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 3));
    Get.put(AuthServices()).Init();
  }
}
