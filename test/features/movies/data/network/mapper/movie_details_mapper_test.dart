import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/features/movies/data/network/mapper/movie_details_mapper.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';

void main() {
  final sut = MovieDetailsMapper();

  test("map SHOULD return MovieDetails with correct MovieDetailsDTO data", () {
    final int id = 1;
    final String title = "title";
    final String overview = "overview";
    final String tagline = "tagline";
    final double rating = 1.0;
    final String imageUrl = "imageUrl";
    final MovieDetailsDTO movieDetailsDTO = MovieDetailsDTO(id: id, title: title, overview: overview, tagline: tagline, rating: rating, image: imageUrl);

    final MovieDetails movieDetails = sut.map(movieDetailsDTO);

    expect(movieDetails, MovieDetails(id: id.toString(), title: title, overview: overview, tagline: tagline, rating: rating, image: "https://image.tmdb.org/t/p/w500/$imageUrl"));
  });

  test("map SHOULD return MovieDetails with default values WHEN not available in MovieDetailsDTO", () {
    final MovieDetailsDTO movieDetailsDTO = MovieDetailsDTO();

    final MovieDetails movieDetails = sut.map(movieDetailsDTO);

    expect(movieDetails, MovieDetails(id: "", title: "", overview: "", tagline: "", rating: 0.0, image: ""));
  });
}
