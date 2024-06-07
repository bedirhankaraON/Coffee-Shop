// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_espresso/core/services/coffees_service.dart' as _i3;
import 'package:flutter_espresso/features/coffees/data/data_sources/default_remote_coffees_data_source.dart'
    as _i7;
import 'package:flutter_espresso/features/coffees/data/data_sources/remote_coffees_data_source.dart'
    as _i6;
import 'package:flutter_espresso/features/coffees/data/repositories/default_coffee_repository.dart'
    as _i8;
import 'package:flutter_espresso/features/coffees/domain/repositories/coffee_repository.dart'
    as _i5;
import 'package:flutter_espresso/features/coffees/domain/use_cases/get_coffees_use_case.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CoffeesService>(() => const _i3.CoffeesService());
  gh.factory<_i4.GetCoffeesUseCase>(
      () => _i4.GetCoffeesUseCase(repository: gh<_i5.CoffeeRepository>()));
  gh.factory<_i6.RemoteCoffeesDataSource>(
      () => _i7.DefaultRemoteCoffeesDataSource(gh<_i3.CoffeesService>()));
  gh.factory<_i5.CoffeeRepository>(
      () => _i8.DefaultCoffeeRepository(gh<_i6.RemoteCoffeesDataSource>()));
  return getIt;
}
