import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/core/error/failures.dart';
import 'package:flutter_espresso/features/coffees/data/data_sources/remote_coffees_data_source.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:flutter_espresso/features/coffees/domain/repositories/coffee_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoffeeRepository)
class DefaultCoffeeRepository extends CoffeeRepository {
  const DefaultCoffeeRepository(this._remoteCoffeesDataSource);

  final RemoteCoffeesDataSource _remoteCoffeesDataSource;

  @override
  Future<DataResult<List<Coffee>>> getCoffees() async {
    try {
      final coffees = await _remoteCoffeesDataSource.getCoffees();

      return DataResult.success(coffees.map((e) => e.toEntity()).toList());
    } catch (e, s) {
      return DataResult.failure(Failure.fromException(e, s));
    }
  }
}
