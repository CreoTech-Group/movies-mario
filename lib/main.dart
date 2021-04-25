import 'package:flutter/material.dart';
import 'package:gdg_movies/di/injection_container.dart' as di;
import 'package:gdg_movies/router_generator.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GDG Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        initialRoute: "/",
        onGenerateRoute: RouterGenerator().generateRoutes);
  }
}
