import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getPlayingNow({int page = 1}) {
    return datasource.getPlayingNow(page: page);
  }
}
