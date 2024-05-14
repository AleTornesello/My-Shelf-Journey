import 'package:flutter/material.dart';

class MyShelfJourney extends StatelessWidget {
  const MyShelfJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
