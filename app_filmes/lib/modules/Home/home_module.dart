import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/Home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/home",
      page: () => HomePage(),
    )
  ];
}
