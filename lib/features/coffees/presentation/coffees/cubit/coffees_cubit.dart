import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/injection.dart';

part 'coffees_state.dart';

class CoffeesCubit extends Cubit<CoffeesState> {
  CoffeesCubit({
    GetCoffeesUseCase? getCoffeesUseCase,
  })  : _getCoffeesUseCase = getCoffeesUseCase ?? getIt.get<GetCoffeesUseCase>(),
        super(CoffeesState.initial());

  final GetCoffeesUseCase _getCoffeesUseCase;

  void searchCoffees({String filter = ''}) {
    final filteredCofees = <Coffee>[];
    for (final unit in state.coffees) {
      if (unit.title!.toUpperCase().contains(filter.toUpperCase())) {
        filteredCofees.add(unit);
      }
    }
    emit(state.copyWith(filteredCofees: filteredCofees));
  }

  Future<void> getCoffees() async {
    emit(state.copyWith(status: CoffeesStatus.loading));
    final result = await _getCoffeesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CoffeesStatus.failure,
        ),
      ),
      (coffees) => emit(
        state.copyWith(
          status: CoffeesStatus.success,
          coffees: coffees,
          filteredCofees: coffees,
        ),
      ),
    );
  }
}
