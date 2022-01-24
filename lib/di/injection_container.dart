import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/core/di/core_dependencies.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:gdg_movies/features/movies/di/movies_container.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_presenter.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_presenter.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  _initCoreDependencies();
  _initMoviesDependencies();
}

void _initCoreDependencies() {
  final coreDependenciesContainer = CoreDependencyContainer();
  getIt.registerSingleton<http.Client>(coreDependenciesContainer.provideHttpClient());
  getIt.registerLazySingleton<ApiProvider>(() => coreDependenciesContainer.provideApi(getIt()));
}

void _initMoviesDependencies() {
  final moviesDependenciesContainer = MoviesDependencyProvider();
  getIt.registerLazySingleton<MoviesApi>(() => moviesDependenciesContainer.provideMoviesApi(getIt()));
  getIt.registerLazySingleton<Mapper<MovieDTO, Movie>>(() => moviesDependenciesContainer.provideMovieMapper());
  getIt.registerLazySingleton<Mapper<MovieDetailsDTO, MovieDetails>>(() => moviesDependenciesContainer.provideMovieDetailsMapper());
  getIt.registerLazySingleton<MoviesRepository>(() => moviesDependenciesContainer.provideMovieRepository(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => HomePresenter());
  getIt.registerFactory(() => MovieDetailsPresenter());
}