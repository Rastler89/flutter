import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayinMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayinMovies.isEmpty) return [];
  return nowPlayinMovies.sublist(0,6);
});