class MovieDetails {
  final String id;
  final String title;
  final String overview;
  final String tagline;
  final double rating;
  final String image;
  
  MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.tagline,
    required this.rating,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieDetails &&
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
