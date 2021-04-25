import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/core/network/api_provider_impl.dart';

import 'package:http/http.dart' as http;

class CoreDependencyContainer {
  ApiProvider provideApi(http.Client client) {
    return ApiProviderImpl(client, 'api.themoviedb.org', '51c33d10ebc31ef012b00c9b8d05b2de');
  }

  http.Client provideHttpClient() {
    return http.Client();
  }
}