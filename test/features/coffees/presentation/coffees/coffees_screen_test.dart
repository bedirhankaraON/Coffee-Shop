import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/coffees_screen.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';
import 'package:flutter_espresso/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helpers/any.dart';
import '../../../../helpers/device_size_util.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late Widget widget;
  late GetCoffeesUseCase mockGetCoffeesUseCase;
  late CoffeesCubit mockCoffeesCubit;

  setUp(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    mockGetCoffeesUseCase = MockGetCoffeesUseCase();
    mockCoffeesCubit = MockCoffeesCubit();
    widget = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(
        value: mockCoffeesCubit,
        child: const CoffeesScreen(),
      ),
    );

    await GetIt.I.reset();
    getIt.registerSingleton<GetCoffeesUseCase>(mockGetCoffeesUseCase);

    when(() => mockGetCoffeesUseCase.call()).thenAnswer((_) async => DataResult.success(Any.coffeeList));
    when(() => mockCoffeesCubit.getCoffees()).thenAnswer((_) async => {});
    when(() => mockCoffeesCubit.state).thenReturn(CoffeesState.initial());
  });

  group(CoffeesScreen, () {
    testWidgets('Should render CircularProgressIndicator when state is loading', (tester) async {
      when(() => mockCoffeesCubit.state).thenReturn(CoffeesState.initial().copyWith(status: CoffeesStatus.loading));
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Should render BackgroundWidget', (tester) async {
      when(() => mockCoffeesCubit.state).thenReturn(CoffeesState.initial().copyWith(status: CoffeesStatus.success));
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(BackgroundWidget), findsOneWidget);
    });

    testGoldens(
      'should have the correct golden test',
      (WidgetTester tester) async {
        when(() => mockCoffeesCubit.state).thenReturn(
          CoffeesState.initial().copyWith(
            status: CoffeesStatus.success,
            coffees: Any.coffeeList,
            filteredCofees: Any.coffeeList,
          ),
        );
        final deviceBuilder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: DeviceSizeUtil.mustTestDevices)
          ..addScenario(widget: widget);

        mockNetworkImagesFor(() => tester.pumpDeviceBuilder(deviceBuilder));
        await screenMatchesGolden(tester, 'coffees_screen_golden');
      },
      tags: 'golden',
    );
  });
}
