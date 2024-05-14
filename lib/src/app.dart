import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/routing/routes.dart';

class MyShelfJourney extends StatelessWidget {
  const MyShelfJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      onGenerateRoute: Routes.generate,
    );
  }
}
