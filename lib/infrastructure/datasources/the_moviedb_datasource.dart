import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class TheMoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Enviroment.moviesKey, 'language': 'es-MX'}));
  @override
  Future<List<Movie>> getPlayingNow({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final theMovieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = theMovieDBResponse.results
        .where((movieDB) => movieDB.posterPath != '')
        .map((movieDb) => MovieMapper.theMovieDBToEntity(movieDb))
        .toList();

    return movies;
  }
}
