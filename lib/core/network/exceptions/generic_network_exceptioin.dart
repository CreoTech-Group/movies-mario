
import 'package:gdg_movies/core/network/exceptions/network_exception.dart';

class GenericNetworkException extends NetworkException {
  GenericNetworkException(String message)
      : super(message, "Error communicating with server: ");
}
