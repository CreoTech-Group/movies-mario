import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  final MoviesRepository moviesRepository = MockMoviesRepository();
  final sut = GetMovieDetailsUseCaseImpl(moviesRepository);

  test("call SHOULD return MovieDetails from repository getMovieDetails", () async {
    final movieId = "id";
    final movieDetails = MovieDetails(id: movieId, title: "", overview: "", tagline: "", rating: 0.0, image: "");
    when(() => moviesRepository.getMovieDetails(movieId)).thenAnswer((_) => Future.value(movieDetails));

    final MovieDetails movieDetailsResult = await sut.call(movieId);

    expect(movieDetailsResult, movieDetails);
  });
}