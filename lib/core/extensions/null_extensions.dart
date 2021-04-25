extension NullExtensions<R> on R? {
  R orDefault(R defaultValue) {
    if (this != null) {
      return this!;
    }
    return defaultValue;
  }
}