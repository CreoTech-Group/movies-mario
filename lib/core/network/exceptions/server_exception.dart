import 'package:gdg_movies/core/network/exceptions/network_exception.dart';

class ServerException extends NetworkException {
  ServerException(String message) : super(message, "Server error: ");
}
