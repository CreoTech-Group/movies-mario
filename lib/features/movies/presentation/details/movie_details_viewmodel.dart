import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';

abstract class MovieDetailsViewModel {
  MovieDetailsViewModel._();

  factory MovieDetailsViewModel.loading() =>
      MovieDetailsViewModelLoading._();
    
  factory MovieDetailsViewModel.content(MovieDetails movieDetails) =>
    MovieDetailsViewModelContent._(movieDetails: movieDetails);

  factory MovieDetailsViewModel.error() =>
    MovieDetailsViewModelError._();
}

class MovieDetailsViewModelLoading extends MovieDetailsViewModel {
    MovieDetailsViewModelLoading._() : super._();

    @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsViewModelLoading && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}

class MovieDetailsViewModelContent extends MovieDetailsViewModel {
  final MovieDetails movieDetails;
  MovieDetailsViewModelContent._({required this.movieDetails}) : super._();

  @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsViewModelContent && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}

class MovieDetailsViewModelError extends MovieDetailsViewModel {
  MovieDetailsViewModelError._() : super._();

  @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsViewModelError && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}