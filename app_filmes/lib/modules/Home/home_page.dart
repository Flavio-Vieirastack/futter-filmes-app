import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/modules/Home/home_controller.dart';
import 'package:app_filmes/modules/favorites/Favorites_page.dart';
import 'package:app_filmes/modules/movies/Movies_page.dart';
import 'package:app_filmes/modules/movies/Movires_bindings.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          selectedItemColor: context.iconClicledColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filmes"),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty), label: "Favoritos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: "Sair"),
          ],
        );
      }),
      body: Navigator(
        initialRoute: "/movies",
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == "/movies") {
            return GetPageRoute(
              settings: settings,
              page: () => MoviesPage(),
              binding: MoviresBindings(),
            );
          }

          if (settings.name == "/favorites") {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesPage(),
            );
          }
        },
      ),
    );
  }
}
