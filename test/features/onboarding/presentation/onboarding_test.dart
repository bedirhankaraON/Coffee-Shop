import 'package:flutter/material.dart';
import 'package:flutter_espresso/core/data_result.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/coffees_page.dart';
import 'package:flutter_espresso/features/onboarding/presentation/onboarding.dart';
import 'package:flutter_espresso/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/device_size_util.dart';
import '../../../helpers/mocks.dart';

void main() {
  const widget = OnboardingScreen();
  late GetCoffeesUseCase mockGetCoffeesUseCase;

  setUp(() async {
    GoogleFonts.config.allowRuntimeFetching = false;
    mockGetCoffeesUseCase = MockGetCoffeesUseCase();
    await GetIt.I.reset();
    getIt.registerSingleton<GetCoffeesUseCase>(mockGetCoffeesUseCase);

    when(() => mockGetCoffeesUseCase.call()).thenAnswer((_) async => DataResult.success([]));
  });

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  testWidgets('Button is present and triggers navigation after tapped', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: widget,
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    // verify(mockObserver.didPush(any(), any()));
    verify(() => mockObserver.didPush(any(), any()));

    /// You'd also want to be sure that your page is now
    /// present in the screen.
    expect(find.byType(CoffeesPage), findsOneWidget);
  });
  testGoldens(
    'should have the correct golden test',
    (WidgetTester tester) async {
      final deviceBuilder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: DeviceSizeUtil.mustTestDevices)
        ..addScenario(widget: widget);

      await tester.pumpDeviceBuilder(deviceBuilder);
      await screenMatchesGolden(tester, 'onboarding_screen_golden');
    },
    tags: 'golden',
  );
}
