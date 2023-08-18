import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;

  const MoviesHorizontalListView(
      {super.key, required this.movies, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _TitlesBar(title: title, subtitle: subtitle),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return _MovieCard(movie: movies[index]);
            },
          )),
        ],
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;
  const _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath,
                    width: 150, fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              )),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
          Row(
            children: [
              Icon(Icons.star_half_outlined,
                  size: 20, color: Colors.yellow[700]),
              const SizedBox(width: 5),
              Text('${movie.voteAverage}',
                  style: textStyles.bodyMedium!
                      .copyWith(color: Colors.yellow[700])),
              const SizedBox(width: 10),
              Text('${movie.voteAverage}', style: textStyles.bodyMedium),
            ],
          )
        ],
      ),
    );
  }
}

class _TitlesBar extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _TitlesBar({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (title != null) Text(title!, style: textStyle),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(
                subtitle!,
              ),
            )
        ],
      ),
    );
  }
}
