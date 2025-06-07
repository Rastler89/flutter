import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

    final MoviesDatasource datasource;

    MovieRepositoryImpl(this.datasource);

    @override
    Future<List<Movie>> getNowPlaying({int page = 1}) {
        return datasource.getNowPlaying(page: page);
    }
    
    @override
    Future<List<Movie>> getPopular({int page = 1}) {
      return datasource.getPopular(page: page);
    }
      
    @override
    Future<List<Movie>> getComing({int page = 1}) {
      return datasource.getComing(page: page);
    }
        
    @override
    Future<List<Movie>> topRated({int page = 1}) {
      return datasource.topRated(page: page);
    }
    
    @override
    Future<Movie> getMovieById(String id) {
      return datasource.getMovieById(id);
    }
      
    @override
    Future<List<Movie>> searchMovies(String query) {
      return datasource.searchMovies(query);
    }

}