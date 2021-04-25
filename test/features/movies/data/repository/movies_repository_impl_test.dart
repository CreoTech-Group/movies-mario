import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:gdg_movies/features/movies/data/repository/movies_repository_impl.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_details_error.dart';
import 'package:gdg_movies/features/movies/domain/model/error/movie_popular_error.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:mocktail/mocktail.dart';

class MockMoviesApi extends Mock implements MoviesApi {}
class MockMovieMapper extends Mock implements Mapper<MovieDTO, Movie> {}
class MockMovieDetailsMapper extends Mock implements Mapper<MovieDetailsDTO, MovieDetails> {}

void main() {
  final MoviesApi moviesApi = MockMoviesApi();
  final Mapper<MovieDTO, Movie> movieMapper = MockMovieMapper();
  final Mapper<MovieDetailsDTO, MovieDetails> movieDetailsMapper = MockMovieDetailsMapper();

  final sut = MoviesRepositoryImpl(moviesApi, movieMapper, movieDetailsMapper);

  test("getPopularMovies SHOULD return list of Movie WHEN api is successful", () async {
    final MovieDTO movieDTO = MovieDTO();
    final List<MovieDTO> movieDTOs = [movieDTO];
    final Movie movie = Movie(id: "id", image: "image");
    
    when(() => moviesApi.getPopularMovies()).thenAnswer((_) => Future.value(movieDTOs));
    when(() => movieMapper.map(movieDTO)).thenReturn(movie);

    final List<Movie> movies = await sut.getPopularMovies();

    expect(movies, [movie]);
  });

  test("getPopularMovies SHOULD throw MoviePopularException WHEN api fails", () {
    when(() => moviesApi.getPopularMovies()).thenAnswer((_) => Future.error(Exception()));

    expect(() async => await sut.getPopularMovies(), throwsA(isA<MoviePopularException>()));
  });

  test("getMovieDetails SHOULD return MovieDetails WHEN api is successful", () async {
    final String movieId = "id";
    final MovieDetailsDTO movieDetailsDTO = MovieDetailsDTO();
    final MovieDetails movieDetails = MovieDetails(id: "", title: "", overview: "", tagline: "", rating: 0.0, image: "");
    
    when(() => moviesApi.getMovieDetails(movieId)).thenAnswer((_) => Future.value(movieDetailsDTO));
    when(() => movieDetailsMapper.map(movieDetailsDTO)).thenReturn(movieDetails);

    final MovieDetails movieDetailsResult = await sut.getMovieDetails(movieId);

    expect(movieDetailsResult, movieDetails);
  });

  test("getMovieDetails SHOULD throw MovieDetailsError WHEN api fails", () {
    final String movieId = "movieId";
    when(() => moviesApi.getMovieDetails(movieId)).thenAnswer((_) => Future.error(Exception()));

    expect(() async => await sut.getMovieDetails(movieId), throwsA(isA<MovieDetailsException>()));
  });
}