import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/repositories/login/login_repository_impl.dart';
import 'package:app_filmes/services/login/login_services.dart';
import 'package:app_filmes/services/login/login_services_impl.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    Get.lazyPut<LoginServices>(
        () => LoginServicesImpl(loginRepository: Get.find()), fenix: true);
  }
}
 