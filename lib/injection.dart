import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_espresso/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  asExtension: false,
  generateForDir: [
    'lib',
  ],
)
Future<void> configureDependencies({String? environment = Environment.dev}) async => $initGetIt(
      getIt,
      environment: environment,
    );
