import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/data/network/mapper/movie_mapper.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';

void main() {
  final sut = MovieMapper();

  test("map SHOULD return Movie with correct MovieDTO data", () {
    final id = 1;
    final imageUrl = "imageUrl";
    final MovieDTO movieDTO = MovieDTO(id: id, image: imageUrl);

    final Movie movie = sut.map(movieDTO);

    expect(movie, Movie(id: id.toString(), image: "https://image.tmdb.org/t/p/w500/$imageUrl"));
  });

  test("map SHOULD return Movie with default values WHEN not available in MovieDTO", () {
    final MovieDTO movieDTO = MovieDTO();

    final Movie movie = sut.map(movieDTO);

    expect(movie, Movie(id: "", image: ""));
  });
}
