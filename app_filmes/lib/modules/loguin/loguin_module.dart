import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/loguin/loguin_binding.dart';
import 'package:app_filmes/modules/loguin/loguin_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoguinModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/loguin",
      page: () => LoguinPage(),
      binding: LoguinBinding(),
    )
  ];
}
