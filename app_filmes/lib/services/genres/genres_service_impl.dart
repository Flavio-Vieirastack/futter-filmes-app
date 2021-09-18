import 'package:app_filmes/models/genres_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'package:flutter/widgets.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {

  final GenresRepository _genresRepository;

    GenresServiceImpl({required GenresRepository geresRepository}) : _genresRepository = geresRepository;

  @override
  Future<List<GenresModel>> getGenres() => _genresRepository.getGenres();
  
  }

