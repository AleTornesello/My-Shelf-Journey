import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/theme/theme.dart';

class MyShelfJourney extends StatelessWidget {
  const MyShelfJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.appTitle;
      },
      restorationScopeId: 'app',
      theme: MsjThemeDataGenerator.generate(context),
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
      onGenerateRoute: Routes.generate,
    );
  }
}
