import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/features/movies/data/network/model/movies_popular_response.dart';
import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/features/movies/data/network/api/movies_api.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';

class MoviesApiImpl implements MoviesApi {

  ApiProvider _apiProvider;
  MoviesApiImpl(this._apiProvider);

  @override
  Future<List<MovieDTO>> getPopularMovies() async {
    final Map<String, dynamic> moviesJson = await _apiProvider.get("/3/movie/popular");
    final moviesResponse = MoviesPopularResponse.fromMap(moviesJson);
    return moviesResponse.results.map((e) => MovieDTO.fromMap(e)).toList();
  }

  @override
  Future<MovieDetailsDTO> getMovieDetails(String movieId) async {
    final Map<String, dynamic> movieDetailsJson = await _apiProvider.get("/3/movie/$movieId");
    return MovieDetailsDTO.fromMap(movieDetailsJson);
  }
}
