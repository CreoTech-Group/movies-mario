import 'dart:convert';

class MoviesPopularResponse {
  List<Map<String, dynamic>> results;
  MoviesPopularResponse({
    required this.results,
  });

  factory MoviesPopularResponse.fromMap(Map<String, dynamic> map) {
    return MoviesPopularResponse(
      results: List<Map<String, dynamic>>.from(map['results']?.map((x) => x)),
    );
  }

  factory MoviesPopularResponse.fromJson(String source) => MoviesPopularResponse.fromMap(json.decode(source));
}
