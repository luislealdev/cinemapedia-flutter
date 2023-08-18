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
    return Column(
      children: [
        TitlesBar(title: title, subtitle: subtitle),
        const SizedBox(
          height: 260,
          child: Placeholder(),
        ),
      ],
    );
  }
}

class TitlesBar extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const TitlesBar({super.key, this.title, this.subtitle});

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
              style: ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(
                subtitle!,
              ),
            )
        ],
      ),
    );
  }
}
