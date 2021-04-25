import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';

abstract class MoviesApi {
  Future<List<MovieDTO>> getPopularMovies();
  Future<MovieDetailsDTO> getMovieDetails(String movieId);
}