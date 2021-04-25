import 'package:gdg_movies/core/network/exceptions/network_exception.dart';

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
