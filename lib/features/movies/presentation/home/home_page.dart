import 'package:flutter/material.dart';

import 'package:gdg_movies/features/movies/domain/model/movie.dart';
import 'package:gdg_movies/features/movies/presentation/home/home_presenter.dart';
import 'package:gdg_movies/features/movies/presentation/home/widget/content_header.dart';
import 'package:gdg_movies/features/movies/presentation/home/widget/content_list.dart';
import 'package:gdg_movies/features/movies/presentation/home/widget/custom_app_bar.dart';
import 'package:gdg_movies/features/movies/presentation/home/widget/previews.dart';

class HomePage extends StatefulWidget {
  final HomePresenter _homePresenter;

  const HomePage(
    this._homePresenter, {
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    widget._homePresenter.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
      ),
      body: Container()
    );
  }
}

class _HomeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _HomeErrorWidget extends StatelessWidget {
  final HomePresenter moviesListPresenter;
  const _HomeErrorWidget({
    Key? key,
    required this.moviesListPresenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Movies loading failed'),
          ElevatedButton(
              onPressed: () {
                moviesListPresenter.getPopularMovies();
              },
              child: Text('Retry')),
        ],
      ),
    );
  }
}

class _HomeListWidget extends StatelessWidget {
  final List<Movie> movies;
  const _HomeListWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ContentHeader(featuredContent: movies[0]),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20.0),
          sliver: SliverToBoxAdapter(
            child: Previews(
              key: PageStorageKey('previews'),
              title: 'Previews',
              contentList: movies,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ContentList(
            key: PageStorageKey('myList'),
            title: 'My List',
            contentList: movies,
          ),
        ),
        SliverToBoxAdapter(
          child: ContentList(
            key: PageStorageKey('originals'),
            title: 'Netflix Originals',
            contentList: movies,
            isOriginals: true,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 20.0),
          sliver: SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('trending'),
              title: 'Trending',
              contentList: movies,
            ),
          ),
        )
      ],
    );
  }
}
