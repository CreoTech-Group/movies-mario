import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_popular_error.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_presenter.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPopularMoviesUseCase extends Mock implements GetPopularMoviesUseCase {}

void main() {
  final GetPopularMoviesUseCase getPopularMoviesUseCase = MockGetPopularMoviesUseCase();

  final sut = HomePresenter(getPopularMoviesUseCase);

  test("getPopularMovies SHOULD start with loading state WHEN invoked", () async {
    when(() => getPopularMoviesUseCase()).thenAnswer((_) => Future.value([Movie(id:"", image: "")]));

    sut.getPopularMovies();

    await expectLater(sut.moviesViewModel, emitsInOrder([
      HomeViewModel.loading()
    ]));
  });

  test("getPopularMovies SHOULD emit content with movies state WHEN use case is successful", () async {
    final movies = [Movie(id:"", image: "")];
    when(() => getPopularMoviesUseCase()).thenAnswer((_) => Future.value(movies));

    sut.getPopularMovies();

    await expectLater(sut.moviesViewModel, emitsInOrder([
      HomeViewModel.loading(),
      HomeViewModel.content(movies)
    ]));
  });

  test("getPopularMovies SHOULD emit error state WHEN use case throws MoviePopularException", () async {
    when(() => getPopularMoviesUseCase()).thenAnswer((_) => Future.error(MoviePopularException()));

    sut.getPopularMovies();

    await expectLater(sut.moviesViewModel, emitsInOrder([
      HomeViewModel.loading(),
      HomeViewModel.error()
    ]));
  });
}