import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListview extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? onNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.onNextPage,
  });

  @override
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(widget.onNextPage == null) return;
      if(scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent) {
        widget.onNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, 
      child: Column(
        children: [
          if(widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  return FadeInRight(child: _Slide(movie: widget.movies[index]));
                },
              )
            )
        ]
      )
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({
    required this.movie,
});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fit: BoxFit.cover,
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const SizedBox(
                      width: 150,
                      height: 225,
                      child: Center(child: CircularProgressIndicator())
                    );
                  }
                  return GestureDetector(
                    child: FadeIn(child: child),
                    onTap: () => context.push('/home/0/movie/${movie.id}')
                  );
                  //return FadeIn(child: child);
                },
              )
            )
          ),
          const SizedBox(height: 5),
          //* Movie Title */
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            )
          ),
          //* Rating */
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon (Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                Spacer(),
                Text(HumanFormats.number(movie.popularity), style: textStyle.bodyMedium),
                //Text('${movie.popularity}', style: textStyle.bodyMedium)
              ]
            ),
          )
        ]
      )
    );
  }
}

class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title != null)
            Text(title!, style: titleStyle),
          const Spacer(),
          if(subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!)
            )
        ]
      )
    );
  }
}