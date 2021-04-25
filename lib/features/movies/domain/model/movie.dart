class Movie {
  final String id;
  final String image;
  
  Movie({
    required this.id,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Movie &&
      other.id == id &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}
