import 'package:gdg_movies/features/movies/domain/model/error/movie_popular_error.dart';
import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_viewmodel.dart';
import 'package:rxdart/subjects.dart';
import 'package:gdg_movies/features/movies/domain/usecase/get_popular_movies_usecase.dart';

class HomePresenter {
  Subject<HomeViewModel> _moviesSubject = BehaviorSubject();
  GetPopularMoviesUseCase _getPopularMoviesUseCase;

  Stream<HomeViewModel> get moviesViewModel => _moviesSubject.stream;

  HomePresenter(
    this._getPopularMoviesUseCase,
  );

  void getPopularMovies() async {
    _moviesSubject.add(HomeViewModel.loading());
    try {
      final List<Movie> movies = await _getPopularMoviesUseCase();
      _moviesSubject.add(HomeViewModel.content(movies));
    } on MoviePopularException {
      _moviesSubject.add(HomeViewModel.error());
    }
  }

  void dispose() {
    _moviesSubject.close();
  }
}
