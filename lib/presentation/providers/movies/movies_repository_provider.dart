import 'package:cinemapedia/infrastructure/datasources/the_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider<MoviesRepositoryImpl>((ref) {
  return MoviesRepositoryImpl(TheMoviedbDatasource());
});
