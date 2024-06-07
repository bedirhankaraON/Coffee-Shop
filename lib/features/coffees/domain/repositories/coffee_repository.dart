import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/core/domain/base_repository.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';

abstract class CoffeeRepository extends BaseRepository {
  const CoffeeRepository();

  Future<DataResult<List<Coffee>>> getCoffees();
}
