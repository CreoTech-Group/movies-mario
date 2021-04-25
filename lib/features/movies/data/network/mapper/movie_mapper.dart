import 'package:gdg_movies/features/movies/data/network/mapper/image_url_mapper.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/core/mapper.dart';
import 'package:gdg_movies/core/extensions/null_extensions.dart';
import 'package:gdg_movies/features/movies/data/network/model/movie_dto.dart';

class MovieMapper extends Mapper<MovieDTO, Movie> {
  @override
  Movie map(MovieDTO input) {
    return Movie(
      id: input.id != null ? input.id.toString() : '',
      image: mapImageUrl(input.image),
    );
  }

  
}