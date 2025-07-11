
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite (Movie movie);

  Future<bool> isMovieFavorite (int moveId);

  Future<List<Movie>> loadMovies ({int limit = 10, offset = 0});
}