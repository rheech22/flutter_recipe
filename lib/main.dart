import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart' hide Badge;

import 'core/presentation/components/input_field.dart';
import 'core/presentation/components/button.dart';
import 'core/presentation/components/badge.dart';
import 'ui/text_styles.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
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
    return MaterialApp(
      title: 'Flutter Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Component',
          style: TextStyles.largeTextBold,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Badge('Text'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Badge(
              'Text',
              isSelected: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Badge('3', variant: BadgeVariants.rating),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Badge(
              '5',
              variant: BadgeVariants.rating,
              isSelected: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              'Big Button',
              onPressed: () {
                print('Big Button Pressed');
              },
              variant: ButtonVariants.big,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              'Medium',
              onPressed: () {
                print('Medium Button Pressed');
              },
              variant: ButtonVariants.medium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              'Small',
              onPressed: () {
                print('Small Button Pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
              label: 'Label',
              placeHolder: 'Place Holder',
            ),
          ),
        ],
      ),
    );
  }
}
