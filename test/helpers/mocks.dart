import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_espresso/core/services/coffees_service.dart';
import 'package:flutter_espresso/features/coffees/data/data_sources/remote_coffees_data_source.dart';
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeesService extends Mock implements CoffeesService {}

class MockRemoteCoffeesDataSource extends Mock implements RemoteCoffeesDataSource {}

class MockGetCoffeesUseCase extends Mock implements GetCoffeesUseCase {}

class MockCoffeesCubit extends MockCubit<CoffeesState> implements CoffeesCubit {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}
