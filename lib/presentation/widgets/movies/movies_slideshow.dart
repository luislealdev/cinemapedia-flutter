import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: Swiper(
          autoplay: true,
          viewportFraction: .8,
          scale: .9,
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieSlide(movie: movies[index]),
        ));
  }
}

class _MovieSlide extends StatelessWidget {
  final Movie movie;
  const _MovieSlide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
