import 'package:flutter_espresso/core/data_result.dart';

abstract class UseCase<Type, Params> {
  Future<DataResult<Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<DataResult<Type>> call();
}
