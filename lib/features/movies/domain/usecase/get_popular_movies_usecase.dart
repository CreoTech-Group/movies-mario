import 'package:gdg_movies/features/movies/domain/model/movie.dart';

abstract class GetPopularMoviesUseCase {
  Future<List<Movie>> call();
}
