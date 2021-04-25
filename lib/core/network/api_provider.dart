import 'package:gdg_movies/core/network/network_response.dart';

abstract class ApiProvider {
  Future<dynamic> get(String url);
}