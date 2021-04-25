String mapImageUrl(String? dtoImageUrl) {
  if (dtoImageUrl != null) {
    return 'https://image.tmdb.org/t/p/w500/$dtoImageUrl';
  }
  return '';
}
