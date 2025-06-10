import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(comingMoviesProvider.notifier).loadNextPage();
    ref.read(ratedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) {
      return const FullScreenLoader();
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final comingMovies = ref.watch(comingMoviesProvider);
    final ratedMovies = ref.watch(ratedMoviesProvider);


    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar()
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                MoviesLideshow(movies: moviesSlideshow),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'En este mes',
                  onNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),
                MovieHorizontalListview(
                  movies: comingMovies,
                  title: 'Próximamente',
                  subTitle: 'En este mes',
                  onNextPage: () => ref.read(comingMoviesProvider.notifier).loadNextPage(),
                  ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  //subTitle: 'En este mes',
                  onNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                MovieHorizontalListview(
                  movies: ratedMovies,
                  title: 'Mejor valoradas',
                  //subTitle: 'En este mes',
                  onNextPage: () => ref.read(ratedMoviesProvider.notifier).loadNextPage(),
                  ),
                const SizedBox(height: 10),
              ]
            );
          },
          childCount: 1,
        ))
      ]
    );
  }
}