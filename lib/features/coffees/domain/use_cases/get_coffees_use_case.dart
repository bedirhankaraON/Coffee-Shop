import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/core/usecases/usecase.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:flutter_espresso/features/coffees/domain/repositories/coffee_repository.dart';
import 'package:flutter_espresso/injection.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCoffeesUseCase extends UseCaseWithoutParams<List<Coffee>> {
  GetCoffeesUseCase({CoffeeRepository? repository}) : _repository = repository ?? getIt.get<CoffeeRepository>();

  final CoffeeRepository _repository;

  @override
  Future<DataResult<List<Coffee>>> call() => _repository.getCoffees();
}
