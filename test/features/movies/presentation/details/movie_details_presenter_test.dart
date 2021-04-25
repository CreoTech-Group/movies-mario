import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_details_error.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_presenter.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMovieDetailsUseCase extends Mock
    implements GetMovieDetailsUseCase {}

void main() {
  final GetMovieDetailsUseCase getMovieDetailsUseCase =
      MockGetMovieDetailsUseCase();

  final sut = MovieDetailsPresenter(getMovieDetailsUseCase);

  test("fetchMovieDetails SHOULD start with loading state WHEN invoked",
      () async {
    final String movieId = "movieId";
    final movieDetails = _makeMovieDetails(movieId);
    when(() => getMovieDetailsUseCase(movieId))
        .thenAnswer((_) => Future.value(movieDetails));

    sut.fetchMovieDetails(movieId);

    await expectLater(sut.movieDetailsViewModel,
        emitsInOrder([MovieDetailsViewModel.loading()]));
  });

  test(
      "fetchMovieDetails SHOULD emit content with movies state WHEN use case is successful",
      () async {
    final String movieId = "movieId";
    final movieDetails = _makeMovieDetails(movieId);
    when(() => getMovieDetailsUseCase(movieId))
        .thenAnswer((_) => Future.value(movieDetails));

    sut.fetchMovieDetails(movieId);

    await expectLater(
        sut.movieDetailsViewModel,
        emitsInOrder([
          MovieDetailsViewModel.loading(),
          MovieDetailsViewModel.content(movieDetails)
        ]));
  });

  test(
      "fetchMovieDetails SHOULD emit error state WHEN use case throws MovieDetailsError",
      () async {
    final String movieId = "movieId";
    when(() => getMovieDetailsUseCase(movieId))
        .thenAnswer((_) => Future.error(MovieDetailsException()));

    sut.fetchMovieDetails(movieId);

    await expectLater(
        sut.movieDetailsViewModel,
        emitsInOrder(
            [MovieDetailsViewModel.loading(), MovieDetailsViewModel.error()]));
  });
}

MovieDetails _makeMovieDetails(String movieId) {
  return MovieDetails(
      id: movieId,
      title: "",
      overview: "",
      tagline: "",
      rating: 0.0,
      image: "");
}
