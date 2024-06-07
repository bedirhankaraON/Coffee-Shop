import 'package:equatable/equatable.dart';
import 'package:flutter_espresso/core/error/base_exception.dart';
import 'package:flutter_espresso/core/error/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.message,
  });

  factory Failure.fromException(Object e, StackTrace s) {
    switch (e.runtimeType) {
      case const (BaseException):
        return GenericFailure(message: (e as BaseException).message);
      case const (ApiResponseException):
        return GenericFailure(message: 'Api Failure: ${(e as ApiResponseException).statusCode}, ${e.error}');
      default:
        return const GenericFailure();
    }
  }

  final String? message;

  @override
  String toString() => '[FAILURE]: ${message ?? ''}';

  @override
  List<Object?> get props => [message];
}

class GenericFailure extends Failure {
  const GenericFailure({
    super.message = 'Generic Failure',
  });
}
