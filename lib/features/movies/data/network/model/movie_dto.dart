import 'dart:convert';

class MovieDTO {
  final int? id;
  final String? image;

  MovieDTO({
    this.id,
    this.image,
  });

  factory MovieDTO.fromMap(Map<String, dynamic> map) {
    return MovieDTO(
      id: map['id'],
      image: map['poster_path'],
    );
  }

  factory MovieDTO.fromJson(String source) => MovieDTO.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieDTO &&
      other.id == id &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}

