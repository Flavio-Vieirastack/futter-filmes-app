import 'package:app_filmes/application/RestClient/rest_client.dart';
import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/repositories/login/login_repository_impl.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';
import 'package:app_filmes/repositories/movies/movies_repository_impl.dart';
import 'package:app_filmes/services/login/login_services.dart';
import 'package:app_filmes/services/login/login_services_impl.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:app_filmes/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override

  void dependencies() {
    
    Get.lazyPut(() => RestClient(), fenix: true);

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);

    Get.lazyPut<LoginServices>(
        () => LoginServicesImpl(loginRepository: Get.find()),
        fenix: true);

    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(restClient: Get.find()), fenix: true
    );

    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(movieRepository: Get.find()), fenix: true);
  }
}
