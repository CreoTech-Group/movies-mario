import 'package:flutter/material.dart';
import 'package:gdg_movies/di/injection_container.dart';
import 'package:gdg_movies/features/movies/presentation/details/movie_details_page.dart';
import 'package:gdg_movies/nav_screen.dart';

class RouterGenerator {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case NavScreen.route:
        return MaterialPageRoute(builder: (_) => NavScreen());
      case MovieDetailsPage.route:
        if (args is MovieDetailsPageArguments) {
          return MaterialPageRoute(builder: (_) => MovieDetailsPage(args, getIt()));
        }
        return _errorRoute();
      default: 
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text('Sorry... feature still not ready'),
        ),
      );
    });
  }
}