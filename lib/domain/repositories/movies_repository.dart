import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPlayingNow({int page = 1});
}
