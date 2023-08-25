import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    final slideshowImages = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                      children: [
                        MoviesSlideshow(movies: slideshowImages),
                        MoviesHorizontalListView(
                            movies: nowPlayingMovies,
                            title: 'Now Playing',
                            subtitle:
                                "${DateTime.now().day} / ${DateTime.now().month}",
                            loadNextPage: () => ref
                                .read(nowPlayingMoviesProvider.notifier)
                                .loadNextPage()),
                        MoviesHorizontalListView(
                            movies: upcomingMovies,
                            title: 'Soon',
                            subtitle: 'This month',
                            loadNextPage: () => ref
                                .read(upcomingMoviesProvider.notifier)
                                .loadNextPage()),
                        MoviesHorizontalListView(
                            movies: popularMovies,
                            title: 'Populars',
                            subtitle: 'Now',
                            loadNextPage: () => ref
                                .read(popularMoviesProvider.notifier)
                                .loadNextPage()),
                        MoviesHorizontalListView(
                            movies: topRatedMovies,
                            title: 'Top Rated',
                            subtitle: 'All times',
                            loadNextPage: () => ref
                                .read(topRatedMoviesProvider.notifier)
                                .loadNextPage()),
                      ],
                    ),
                childCount: 1)),
      ],
    );
  }
}
