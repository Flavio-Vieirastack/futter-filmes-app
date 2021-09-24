import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class MoviesCard extends StatelessWidget {
  final MovieModel movie;
  final dateFomart = DateFormat("y");
  final VoidCallback favoritesCallback;
  MoviesCard({Key? key, required this.movie, required this.favoritesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/movie/detail", arguments: movie.id);
      },
      child: Container(
        padding: EdgeInsets.all(6),
        width: 148,
        height: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  dateFomart.format(DateTime.parse(movie.releaseDate)),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: -11,
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 14,
                    onPressed: this.favoritesCallback,
                    icon: Icon(
                        movie.favorite
                            ? FilmesAppIcons.heart
                            : FilmesAppIcons.heart_empty,
                        color: movie.favorite
                            ? context.iconClicledColor 
                            : Colors.grey
                            ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
