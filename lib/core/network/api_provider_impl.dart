import 'dart:convert';
import 'package:gdg_movies/core/network/api_provider.dart';
import 'package:gdg_movies/core/network/exceptions/bad_request_exception.dart';
import 'package:gdg_movies/core/network/exceptions/generic_network_exceptioin.dart';
import 'package:gdg_movies/core/network/exceptions/server_exception.dart';
import 'package:http/http.dart' as http;

class ApiProviderImpl implements ApiProvider {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  ApiProviderImpl(this._client, this._baseUrl, this._apiKey);

  @override
  Future<dynamic> get(String url) async {
    try {
      final response =
          await _client.get(Uri.https(_baseUrl, url, authParams()));
      return _parseResponse(response);
    } catch (e) {
      throw GenericNetworkException(e.toString());
    }
  }

  dynamic _parseResponse<T>(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 299) {
      return jsonDecode(response.body);
    } else if (statusCode >= 400 && statusCode < 500) {
      throw BadRequestException(response.toString());
    } else if (statusCode >= 500 && statusCode < 600) {
      throw ServerException(response.body);
    } else {
      throw GenericNetworkException(response.body);
    }
  }

  Map<String, String> authParams() {
    return {"api_key": _apiKey};
  }
}
