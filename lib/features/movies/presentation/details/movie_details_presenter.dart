// This presenter should load a movie details from
// Future<MovieDetails> getMovieDetails(String movieId) in MoviesRepository.dart
// If any additional abstractions are needed before calling the repository
// function please add ( services, use cases )
// and display them ( in any way, even just a text field ) on the UI
import 'dart:async';

import 'package:gdg_movies/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsPresenter {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  late ReplayConnectableStream<MovieDetailsViewModel>
      _movieDetailsViewModelStream;
  late PublishSubject<String> _getMovieDetailsTrigger;

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  Stream<MovieDetailsViewModel> get movieDetailsViewModel =>
      _movieDetailsViewModelStream;

  MovieDetailsPresenter(this._getMovieDetailsUseCase) {
    _getMovieDetailsTrigger = PublishSubject();

    _movieDetailsViewModelStream = _getMovieDetailsTrigger
        .asyncMap((event) => _getMovieDetailsUseCase(event))
        .map((data) => MovieDetailsViewModel.content(data))
        .onErrorReturn(MovieDetailsViewModel.error())
        .startWith(MovieDetailsViewModel.loading())
        .publishReplay(maxSize: 1);

    _compositeSubscription.add(_movieDetailsViewModelStream.connect());
  }

  void fetchMovieDetails(String movieId) {
    _getMovieDetailsTrigger.add(movieId);
  }

  void dispose() {
    _compositeSubscription.dispose();
  }
}
