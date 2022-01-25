import 'package:flutter/material.dart';
import 'package:gdg_movies/features/movies/domain/model/movie_details.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_presenter.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_viewmodel.dart';
import 'package:gdg_movies/features/movies/presentation/home/widget/play_button.dart';

class MovieDetailsPageArguments {
  final String movieId;

  MovieDetailsPageArguments({
    required this.movieId,
  });
}

class MovieDetailsPage extends StatefulWidget {
  static const route = "movieDetails";

  final MovieDetailsPageArguments _movieDetailsPageArguments;
  final MovieDetailsPresenter _movieDetailsPresenter;

  MovieDetailsPage(
      this._movieDetailsPageArguments, this._movieDetailsPresenter);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    widget._movieDetailsPresenter
        .fetchMovieDetails(widget._movieDetailsPageArguments.movieId);
  }

  @override
  void dispose() {
    widget._movieDetailsPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: const Icon(Icons.cast),
            )
          ],
        ),
        body: StreamBuilder<MovieDetailsViewModel>(
          initialData: MovieDetailsViewModel.loading(),
          stream: widget._movieDetailsPresenter.movieDetailsViewModel,
          builder: (context, snapshot) {
            if (snapshot.data is MovieDetailsViewModelLoading)
              return _MovieDetailsLoadingWidget();

            if (snapshot.data is MovieDetailsViewModelContent)
              return _MovieDetailsWidget(
                movieDetails: (snapshot.data as MovieDetailsViewModelContent)
                    .movieDetails,
              );

            if (snapshot.data is MovieDetailsViewModelError)
              return _MovieDetailsErrorWidget(
                  movieDetailsPresenter: widget._movieDetailsPresenter,
                  movieId: widget._movieDetailsPageArguments.movieId);

            return SizedBox.shrink();
          },
        ));
  }
}

class _MovieDetailsLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movieDetails;

  const _MovieDetailsWidget({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.red,
            child: Image.network(
              movieDetails.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              movieDetails.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  "99% match",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "2013",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "1h 58m",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: PlayButton(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              movieDetails.overview,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieDetailsErrorWidget extends StatelessWidget {
  final MovieDetailsPresenter movieDetailsPresenter;
  final String movieId;

  const _MovieDetailsErrorWidget({
    Key? key,
    required this.movieDetailsPresenter,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Movie details loading failed'),
          ElevatedButton(
              onPressed: () {
                movieDetailsPresenter.fetchMovieDetails(movieId);
              },
              child: Text('Retry')),
        ],
      ),
    );
  }
}
