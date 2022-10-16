class NoInternetException implements Exception {
  final String message;

  final Uri? uri;

  NoInternetException(this.message, [this.uri]);

  @override
  String toString() => message;
}
