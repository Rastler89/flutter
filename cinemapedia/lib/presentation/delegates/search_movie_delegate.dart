import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMovieCallback onSearch;

  SearchMovieDelegate({required this.onSearch});

  @override
  String get searchFieldLabel => 'Buscar película o serie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded)
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: onSearch(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index)  => _MovieItem(movie: movies[index]),
        );
      }
    );
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;
  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
                )
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: titleStyle.titleMedium),
                const SizedBox(height: 5),
                Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ]
      ),
    );
  }
}