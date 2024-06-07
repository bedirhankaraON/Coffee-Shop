class ApiResponseException implements Exception {
  final Object? error;
  final int statusCode;

  ApiResponseException(this.error, this.statusCode);
}
