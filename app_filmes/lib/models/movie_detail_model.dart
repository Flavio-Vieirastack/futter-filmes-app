import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genres_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenresModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overView;
  final List<String> produtionCompany;
  final String originalLanguage;
  final List<CastModel> cast;

  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overView,
    required this.produtionCompany,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImage': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overView': overView,
      'produtionCompany': produtionCompany,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'];
    var urlImages = urlImagesPosters
            ?.map<String>(
                (i) => 'https://image.tmdb.org/t/p/w200${i['file_path']}')
            .toList() ??
        const [];

    return MovieDetailModel(
      title: map['title'],
      stars: map['vote_average'],
      genres: List<GenresModel>.from(
          map['genres']?.map((x) => GenresModel.fromMap(x))),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overView: map['overview'],
      produtionCompany:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((p) => p["name"])
              .toList(),
      originalLanguage: map['original_language'],
      cast: List<CastModel>.from(
          map["credits"]['cast']?.map((x) => CastModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));
}
