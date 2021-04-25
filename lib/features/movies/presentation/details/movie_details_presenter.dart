import 'package:gdg_movies/features/movies/domain/model/error/movie_details_error.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsPresenter {
  final Subject<MovieDetailsViewModel> _movieDetailsSubject = BehaviorSubject();
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  Stream<MovieDetailsViewModel> get movieDetailsViewModel => _movieDetailsSubject.stream;

  MovieDetailsPresenter(
    this._getMovieDetailsUseCase,
  );

  void fetchMovieDetails(String movieId) async {
    _movieDetailsSubject.add(MovieDetailsViewModel.loading());
    try {
      final movieDetails = await _getMovieDetailsUseCase(movieId);
      _movieDetailsSubject.add(MovieDetailsViewModel.content(movieDetails));
    } on MovieDetailsException {
      _movieDetailsSubject.add(MovieDetailsViewModel.error());
    }
  }

  void dispose() {
    _movieDetailsSubject.close();
  }
}