class NetworkException implements Exception {
  final String _message;
  final String _prefix;

  NetworkException(this._message, this._prefix);

  String toString() {
    return "$_prefix$_message";
  }
}
