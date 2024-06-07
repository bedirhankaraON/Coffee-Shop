import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/core/error/failures.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/any.dart';
import '../../../../../helpers/mocks.dart';

void main() {
  group(CoffeesCubit, () {
    const coffeeList = Any.coffeeList;

    late GetCoffeesUseCase mockGetCoffeesUseCase;

    late CoffeesCubit cubit;
    late CoffeesState initialState;

    setUp(() async {
      mockGetCoffeesUseCase = MockGetCoffeesUseCase();

      initialState = CoffeesState.initial();
      cubit = CoffeesCubit(
        getCoffeesUseCase: mockGetCoffeesUseCase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('has correct initial state', () {
      expect(cubit.state, initialState);
      expect(cubit.state.status, equals(CoffeesStatus.initial));
      expect(cubit.state.coffees, isEmpty);
      expect(cubit.state.filteredCofees, isEmpty);
    });

    group('getCoffees', () {
      blocTest(
        'should emit [CoffeesStatus.success] and tags when GetCoffeesUseCase returns success',
        build: () => cubit,
        setUp: () {
          when(() => mockGetCoffeesUseCase.call()).thenAnswer((_) async => DataResult.success(coffeeList));
        },
        act: (cubit) => cubit.getCoffees(),
        expect: () => [
          initialState.copyWith(status: CoffeesStatus.loading),
          initialState.copyWith(
            status: CoffeesStatus.success,
            coffees: coffeeList,
            filteredCofees: coffeeList,
          ),
        ],
      );

      blocTest(
        'should emit [CoffeesStatus.failure] when GetCoffeesUseCase returns failure',
        build: () => cubit,
        setUp: () {
          when(() => mockGetCoffeesUseCase.call()).thenAnswer(
            (_) async => DataResult.failure(const GenericFailure()),
          );
        },
        act: (cubit) => cubit.getCoffees(),
        expect: () => [
          initialState.copyWith(status: CoffeesStatus.loading),
          initialState.copyWith(status: CoffeesStatus.failure),
        ],
      );
    });

    group('searchCoffees', () {
      final filter = coffeeList.first.title!;

      blocTest(
        'should emit [filteredCofees] when called',
        build: () => cubit,
        seed: () => initialState.copyWith(coffees: coffeeList),
        act: (cubit) => cubit.searchCoffees(filter: filter),
        expect: () => [
          initialState.copyWith(
            coffees: coffeeList,
            filteredCofees: [coffeeList.first],
          ),
        ],
      );
    });
  });
}
