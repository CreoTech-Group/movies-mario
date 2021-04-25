import 'package:gdg_movies/features/movies/domain/model/movie.dart';

abstract class HomeViewModel {
  HomeViewModel._();

  factory HomeViewModel.loading() =>
      HomeViewModelLoading._();
    
  factory HomeViewModel.content(List<Movie> movies) =>
    HomeViewModelContent._(movies);

  factory HomeViewModel.error() =>
    HomeViewModelError._();
}

class HomeViewModelLoading extends HomeViewModel {
    HomeViewModelLoading._() : super._();

    @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeViewModelLoading && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}

class HomeViewModelContent extends HomeViewModel {
  List<Movie> movies;
  HomeViewModelContent._(this.movies) : super._();

  @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeViewModelContent && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}

class HomeViewModelError extends HomeViewModel {
  HomeViewModelError._() : super._();

  @override
    bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeViewModelError && runtimeType == other.runtimeType;

    @override
    int get hashCode => 0;
}