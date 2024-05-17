import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/app.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();

  runApp(const MyShelfJourney());
}
