class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class FechtDataException extends AppException {
  FechtDataException([String? message])
      : super(message, 'Error durante la comunicación con el servidor :');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Solicitud no Invalida: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Solicitud no autorizada');
}

class NoFoundException extends AppException {
  NoFoundException([String? message])
      : super(message, 'El Destino de La URL No Existe');
}

/*class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Entrada Inválida');
}*/

class MessageApiResponseError extends AppException {
  MessageApiResponseError([String? message])
      : super(message, 'A Ocurrido Un Error En El Servidor');
}
