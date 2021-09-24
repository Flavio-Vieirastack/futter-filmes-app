import 'package:app_filmes/application/RestClient/rest_client.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result =
        await _restClient.get<List<MovieModel>>("/movie/popular", query: {
      "api_key": RemoteConfig.instance.getString("api_token"),
      "language": "pt-br",
      "page": "1"
    }, decoder: (data) {
      final results = data["results"];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print("erro ao buscar popular movies [${result.statusText}]");
      throw Exception("Erro ao buscar filmes populares");
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result =
        await _restClient.get<List<MovieModel>>("/movie/top_rated", query: {
      "api_key": RemoteConfig.instance.getString("api_token"),
      "language": "pt-br",
      "page": "1"
    }, decoder: (data) {
      final results = data["results"];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print("erro ao buscar popular movies [${result.statusText}]");
      throw Exception("Erro ao buscar filmes populares");
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result =
        await _restClient.get<MovieDetailModel?>("/movie/$id", query: {
      "api_key": RemoteConfig.instance.getString("api_token"),
      "language": "pt-br",
      "append_to_response": "images,credits",
      "include_image_language": "en, pt-br",
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });
    if (result.hasError) {
      print("erro ao buscar popular movies [${result.statusText}]");
      throw Exception("Erro ao buscar filmes populares");
    }

    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorites(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection("favorites")
          .doc(userId)
          .collection("movies");

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoritesData = await favoriteCollection
            .where("id", isEqualTo: movie.id)
            .limit(1)
            .get();

        favoritesData.docs.first.reference.delete();
      }
    } catch (e, s) {
      print(e);
      print(s);
      print("Erro ao vavotirar filmes");

      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection("favorites")
        .doc(userId)
        .collection("movies")
        .get();

    final listFavorites = <MovieModel>[];

    for (var movie in favoritesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }

    return listFavorites;
  }
}
