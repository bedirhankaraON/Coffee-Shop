import 'package:flutter_espresso/core/error/exceptions.dart';
import 'package:flutter_espresso/core/services/coffees_service.dart';
import 'package:flutter_espresso/features/coffees/data/data_sources/default_remote_coffees_data_source.dart';
import 'package:flutter_espresso/features/coffees/data/dtos/coffee_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/any.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late CoffeesService mockCoffeesService;
  late DefaultRemoteCoffeesDataSource remoteCoffeesDataSource;

  setUp(() {
    mockCoffeesService = MockCoffeesService();
    remoteCoffeesDataSource = DefaultRemoteCoffeesDataSource(mockCoffeesService);
  });

  group(
    DefaultRemoteCoffeesDataSource,
    () {
      group(
        'getCoffees',
        () {
          test('should return Response<List<CoffeeDTO>> when there is no error', () async {
            when(() => mockCoffeesService.getCoffees()).thenAnswer((_) async => Any.successResponse);

            final result = await remoteCoffeesDataSource.getCoffees();

            expect(result, isA<List<CoffeeDTO>>());
            expect(result, Any.coffeeDTOList);
          });

          test('should throw ResponseException when request is not successful', () async {
            when(() => mockCoffeesService.getCoffees()).thenAnswer((_) async => Any.errorResponse);

            expect(remoteCoffeesDataSource.getCoffees(), throwsA(isA<ApiResponseException>()));
          });
        },
      );
    },
  );
}
