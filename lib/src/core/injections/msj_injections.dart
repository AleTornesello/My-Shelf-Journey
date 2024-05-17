import 'package:get_it/get_it.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/providers/datasources_injection_provider.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/providers/repositories_injection_provider.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/providers/usecases_injection_provider.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDatasourcesInjections();
  await initReporitoriesInjections();
  await initUsecasesInjections();
}
