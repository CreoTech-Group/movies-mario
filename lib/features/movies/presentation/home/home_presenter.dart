// This presenter should load the movies from
// Future<List<Movie>> getPopularMovies() in MoviesRepository.dart.
// If any additional abstractions are needed before calling the repository
// function please add ( services, use cases )
// and display them ( in any way, even just a text field ) on the UI. Once
// the user selects a movie, movie details screen should be loaded
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomePresenter {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  late ReplayConnectableStream<HomeViewModel> _moviesViewModelStream;
  late PublishSubject<bool> _getPopularMoviesTrigger;

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  Stream<HomeViewModel> get moviesViewModel => _moviesViewModelStream;

  HomePresenter(this._getPopularMoviesUseCase) {
    _getPopularMoviesTrigger = PublishSubject();

    _moviesViewModelStream = _getPopularMoviesTrigger
        .asyncMap((event) => _getPopularMoviesUseCase())
        .map((data) => HomeViewModel.content(data))
        .onErrorReturn(HomeViewModel.error())
        .startWith(HomeViewModel.loading())
        .publishReplay(maxSize: 1);

    _compositeSubscription.add(_moviesViewModelStream.connect());
  }

  void getPopularMovies() => _getPopularMoviesTrigger.add(true);

  void dispose() {
    _compositeSubscription.dispose();
    _getPopularMoviesTrigger.close();
  }
}
