import 'package:gdg_movies/features/movies/data/network/mapper/image_url_mapper.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_details_dto.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/core/extensions/null_extensions.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';

class MovieDetailsMapper extends Mapper<MovieDetailsDTO, MovieDetails> {
  @override
  MovieDetails map(MovieDetailsDTO input) {
    return MovieDetails(
      id: input.id != null ? input.id.toString() : '',
      title: input.title.orDefault(''),
      overview: input.overview.orDefault(''),
      tagline: input.tagline.orDefault(''),
      rating: input.rating.orDefault(0.0),
      image: mapImageUrl(input.image)   
    );
  }
}