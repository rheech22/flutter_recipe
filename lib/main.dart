import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/core/routing/router.dart';
import 'package:flutter/foundation.dart';

void main() {
  diSetup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Recipe',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
