import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_details_error.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_popular_error.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  MoviesApi _moviesApi;
  Mapper<MovieDTO, Movie> _movieMapper;
  Mapper<MovieDetailsDTO, MovieDetails> _movieDetailsMapper;

  MoviesRepositoryImpl(
    this._moviesApi,
    this._movieMapper,
    this._movieDetailsMapper
  );

  @override
  Future<List<Movie>> getPopularMovies() {
    return Future.value();
  }

  @override
  Future<MovieDetails> getMovieDetails(String movieId) {
    return Future.value();
  }
}
