import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(comingMoviesProvider).isEmpty;
  final step4 = ref.watch(ratedMoviesProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false;
});