import 'package:app_filmes/services/login/login_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const int NAVIGATOR_KEY = 1;
  static const int INDEX_PAGE_EXIT = 2;
  final LoginServices _loginServices;

  HomeController({required LoginServices loginServices})
      : _loginServices = loginServices;

  final _pages = ["/movies", "/favorites"];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);

    if (page == INDEX_PAGE_EXIT) {
      _loginServices.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}
