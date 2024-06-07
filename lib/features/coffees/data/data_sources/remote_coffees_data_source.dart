import 'package:flutter_espresso/core/data/data_sources/base_remote_data_source.dart';
import 'package:flutter_espresso/features/coffees/data/dtos/coffee_dto.dart';

abstract class RemoteCoffeesDataSource extends BaseRemoteDataSource {
  const RemoteCoffeesDataSource();

  Future<List<CoffeeDTO>> getCoffees();
}
