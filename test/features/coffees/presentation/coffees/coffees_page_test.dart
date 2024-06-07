import 'package:flutter/material.dart';
import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffee_details/coffee_details_screen.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/coffees_page.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/coffees_screen.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';
import 'package:flutter_espresso/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/any.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late Widget widget;
  late GetCoffeesUseCase mockGetCoffeesUseCase;
  late CoffeesCubit mockCoffeesCubit;

  setUp(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    mockGetCoffeesUseCase = MockGetCoffeesUseCase();
    mockCoffeesCubit = MockCoffeesCubit();
    widget = CoffeesPage(coffeesCubit: mockCoffeesCubit);

    await GetIt.I.reset();
    getIt.registerSingleton<GetCoffeesUseCase>(mockGetCoffeesUseCase);

    when(() => mockGetCoffeesUseCase.call()).thenAnswer((_) async => DataResult.success(Any.coffeeList));
    when(() => mockCoffeesCubit.getCoffees()).thenAnswer((_) async => {});
    when(() => mockCoffeesCubit.state).thenReturn(CoffeesState.initial());
  });

  testWidgets('Should render CoffeesScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: widget),
    );

    expect(find.byType(CoffeesScreen), findsOneWidget);
  });
}
