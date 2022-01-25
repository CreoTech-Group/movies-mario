import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase.dart';

class GetPopularMoviesUseCaseImpl extends GetPopularMoviesUseCase {
  final MoviesRepository _moviesRepository;

  GetPopularMoviesUseCaseImpl(this._moviesRepository);

  @override
  Future<List<Movie>> call() => _moviesRepository.getPopularMovies();
}
