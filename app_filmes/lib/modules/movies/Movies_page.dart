import 'package:app_filmes/modules/movies/Movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/movies_filters.dart';
import 'package:app_filmes/modules/movies/widgets/movies_group.dart';
import 'package:app_filmes/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          MoviesHeader(),
          MoviesFilters(),
          Container(height: 4, color: Colors.grey[100],),
          MoviesGroup(
            title: "Mais populares",
            movies: controller.popularMovies,
          ),
    Container(height: 4, color: Colors.grey[100],),
          MoviesGroup(
            title: "Top filmes",
            movies: controller.topRatedMovies,
          ),
        ],
      ),
    );
  }
}
