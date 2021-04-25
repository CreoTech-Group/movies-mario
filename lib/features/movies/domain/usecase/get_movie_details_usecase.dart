import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';

abstract class GetMovieDetailsUseCase {
  Future<MovieDetails> call(String movieId);
}