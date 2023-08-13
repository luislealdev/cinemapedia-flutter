import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getPlayingNow({int page = 1});
}
