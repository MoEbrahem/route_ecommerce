class Failures {
  String errMessage;
  Failures({required this.errMessage});
}

class ServerError extends Failures {
  ServerError({required super.errMessage});
}

class NetworkError extends Failures {
  NetworkError({required super.errMessage});
}
