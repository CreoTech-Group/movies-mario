import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  final MoviesRepository moviesRepository = MockMoviesRepository();
  final sut = GetPopularMoviesUseCaseImpl(moviesRepository);

  test("call SHOULD return list of Movie from repository getPopularMovies", () async {
    final movie = Movie(id: "id", image: "image");
    when(() => moviesRepository.getPopularMovies()).thenAnswer((_) => Future.value([movie]));

    final List<Movie> movies = await sut.call();

    expect(movies, [movie]);
  });
}