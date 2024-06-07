import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/features/coffees/data/data_sources/remote_coffees_data_source.dart';
import 'package:flutter_espresso/features/coffees/data/repositories/default_coffee_repository.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:flutter_espresso/features/coffees/domain/repositories/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/any.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late CoffeeRepository coffeeRepository;
  late RemoteCoffeesDataSource mockRemoteCoffeesDataSource;

  setUp(() {
    mockRemoteCoffeesDataSource = MockRemoteCoffeesDataSource();
    coffeeRepository = DefaultCoffeeRepository(mockRemoteCoffeesDataSource);
  });
  group(DefaultCoffeeRepository, () {
    group('getCoffees', () {
      test('should return a list of coffees when success', () async {
        when(() => mockRemoteCoffeesDataSource.getCoffees()).thenAnswer((_) async => Any.coffeeDTOList);

        final result = await coffeeRepository.getCoffees();

        expect(result, isA<DataResult<List<Coffee>>>());
        expect(result.isSuccess, true);
        expect(result.data, Any.coffeeList);
      });

      test('should return failure when data source throws an ApiResponseException', () async {
        when(() => mockRemoteCoffeesDataSource.getCoffees()).thenThrow((_) async => Any.responseException);

        final result = await coffeeRepository.getCoffees();

        expect(result, isA<DataResult<List<Coffee>>>());
        expect(result.isFailure, true);
      });
    });
  });
}
