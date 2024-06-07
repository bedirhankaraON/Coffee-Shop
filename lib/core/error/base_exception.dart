abstract class BaseException implements Exception {
  const BaseException({
    this.message,
    this.customKeys,
  });

  final String? message;
  final Map<String, dynamic>? customKeys;
}
