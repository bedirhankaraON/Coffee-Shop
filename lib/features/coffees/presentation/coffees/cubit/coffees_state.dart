part of 'coffees_cubit.dart';

class CoffeesState extends Equatable {
  const CoffeesState({
    this.status = CoffeesStatus.initial,
    this.filteredCofees = const [],
    this.coffees = const [],
  });

  factory CoffeesState.initial() {
    return const CoffeesState(
      status: CoffeesStatus.initial,
      filteredCofees: [],
      coffees: [],
    );
  }

  final CoffeesStatus status;
  final List<Coffee> filteredCofees;
  final List<Coffee> coffees;

  @override
  List<Object> get props => [
        status,
        filteredCofees,
        coffees,
      ];

  CoffeesState copyWith({
    CoffeesStatus? status,
    List<Coffee>? filteredCofees,
    List<Coffee>? coffees,
  }) {
    return CoffeesState(
      status: status ?? this.status,
      filteredCofees: filteredCofees ?? this.filteredCofees,
      coffees: coffees ?? this.coffees,
    );
  }
}

enum CoffeesStatus { initial, loading, success, failure }
