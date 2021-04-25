import 'dart:convert';

class MovieDetailsDTO {
  final int? id;
  final String? title;
  final String? overview;
  final String? tagline;
  final double? rating;
  final String? image;

  MovieDetailsDTO({
    this.id,
    this.title,
    this.overview,
    this.tagline,
    this.rating,
    this.image,
  });

  factory MovieDetailsDTO.fromMap(Map<String, dynamic> map) {
    return MovieDetailsDTO(
      id: map['id'],
      title: map['title'],
      overview: map['overview'],
      tagline: map['tagline'],
      rating: map['vote_average'].toDouble(),
      image: map['backdrop_path'],
    );
  }

  factory MovieDetailsDTO.fromJson(String source) => MovieDetailsDTO.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieDetailsDTO &&
      other.id == id &&
      other.title == title &&
      other.overview == overview &&
      other.tagline == tagline &&
      other.rating == rating &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      overview.hashCode ^
      tagline.hashCode ^
      rating.hashCode ^
      image.hashCode;
  }
}

