import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/coffees_screen.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';

class CoffeesPage extends StatelessWidget {
  const CoffeesPage({
    super.key,
    @visibleForTesting this.coffeesCubit,
  });

  final CoffeesCubit? coffeesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => coffeesCubit ?? CoffeesCubit()
        ..getCoffees(),
      child: const CoffeesScreen(),
    );
  }
}
