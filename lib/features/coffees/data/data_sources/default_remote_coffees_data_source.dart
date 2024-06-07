import 'dart:convert';

import 'package:flutter_espresso/core/error/exceptions.dart';
import 'package:flutter_espresso/core/services/coffees_service.dart';
import 'package:flutter_espresso/features/coffees/data/data_sources/remote_coffees_data_source.dart';
import 'package:flutter_espresso/features/coffees/data/dtos/coffee_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteCoffeesDataSource)
class DefaultRemoteCoffeesDataSource extends RemoteCoffeesDataSource {
  const DefaultRemoteCoffeesDataSource(this._coffeesService);

  final CoffeesService _coffeesService;

  @override
  Future<List<CoffeeDTO>> getCoffees() async {
    final response = await _coffeesService.getCoffees();

    if (response.statusCode == 200) {
      return (List<Map<String, dynamic>>.from(jsonDecode(utf8.decode(response.bodyBytes))))
          .map((e) => CoffeeDTO.fromJson(e))
          .toList();
    }

    throw ApiResponseException(response, response.statusCode);
  }
}
