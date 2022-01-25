import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase.dart';

class GetMovieDetailsUseCaseImpl extends GetMovieDetailsUseCase {
  final MoviesRepository _moviesRepository;

  GetMovieDetailsUseCaseImpl(this._moviesRepository);

  @override
  Future<MovieDetails> call(String movieId) =>
      _moviesRepository.getMovieDetails(movieId);
}
