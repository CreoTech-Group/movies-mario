import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();
  Future<MovieDetails> getMovieDetails(String movieId);
}
