import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api_impl.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';
import 'package:mocktail/mocktail.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {
  final ApiProvider apiProvider = MockApiProvider();
  final sut = MoviesApiImpl(apiProvider);

  test("getPopularMovies SHOULD return list of MovieDTO WHEN successfull api call", () async {
    final int id = 1;
    final String imageUrl = "imageUrl";
    final json = _ApiFixtures.createPopularMoviesJson(id: id, imageUrl: imageUrl);
    when(() => apiProvider.get("/3/movie/popular")).thenAnswer((_) => Future.value(json));

    final List<MovieDTO> popularMovies = await sut.getPopularMovies();
    expect(popularMovies, { MovieDTO(id: id, image: imageUrl) });
  });

  test("getMovieDetails SHOULD return MovieDetailsDTO WHEN movie id provided and successful api call", () async {
    final int id = 1;
    final String title = "title";
    final String overview = "overview";
    final String tagline = "tagline";
    final double rating = 1.0;
    final String imageUrl = "imageUrl";
    
    final json = _ApiFixtures.createMovieDetailsJson(id: id, title: title, overview: overview, tagline: tagline, rating: rating, imageUrl: imageUrl);
    when(() => apiProvider.get("/3/movie/$id")).thenAnswer((_) => Future.value(json));

    final MovieDetailsDTO movieDetailsDTO = await sut.getMovieDetails(id.toString());
    expect(movieDetailsDTO, MovieDetailsDTO(id: id, title: title, overview: overview, tagline: tagline, rating: rating, image: imageUrl));
  }); 
}

class _ApiFixtures {
  static Map<String, dynamic> createPopularMoviesJson({required int id, required String imageUrl}) {
    return {
      "results": [
        {
          "id": id,
          "poster_path": imageUrl
        }
      ]
    };
  }

  static Map<String, dynamic> createMovieDetailsJson({required int id, required String title, required String overview, required String tagline, required double rating, required String imageUrl}) {
    return {
      "id": id,
      "title": title,
      "overview": overview,
      "tagline": tagline,
      "vote_average": rating,
      "backdrop_path": imageUrl
    };
  }
}