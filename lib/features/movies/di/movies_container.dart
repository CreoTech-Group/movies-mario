import 'package:gdg_movies/features/movies/data/network/mapper/movie_details_mapper.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api_impl.dart';
import 'package:gdg_movies/features/movies/data/network/mapper/movie_mapper.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:gdg_movies/features/movies/data/repository/movies_repository_impl.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase_impl.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase_impl.dart';

class MoviesDependencyProvider {
  MoviesApi provideMoviesApi(ApiProvider apiProvider) {
    return MoviesApiImpl(apiProvider);
  }

  Mapper<MovieDTO, Movie> provideMovieMapper() {
    return MovieMapper();
  }

  Mapper<MovieDetailsDTO, MovieDetails> provideMovieDetailsMapper() {
    return MovieDetailsMapper();
  }

  MoviesRepository provideMovieRepository(MoviesApi moviesApi, Mapper<MovieDTO, Movie> movieMapper, Mapper<MovieDetailsDTO, MovieDetails> movieDetailsMapper) {
    return MoviesRepositoryImpl(moviesApi, movieMapper, movieDetailsMapper);
  }

  GetPopularMoviesUseCase provideGetPopularMoviesUseCase(MoviesRepository moviesRepository) {
    return GetPopularMoviesUseCaseImpl(moviesRepository);
  }

  GetMovieDetailsUseCase provideGetMovieDetailsUseCase(MoviesRepository moviesRepository) {
    return GetMovieDetailsUseCaseImpl(moviesRepository);
  }
}