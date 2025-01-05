import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_recipe/data/repository/fake_bookmark_repository_impl.dart';
import 'package:flutter_recipe/data/repository/fake_recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/dev_only/components_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe/presentation/signin/signin_screen.dart';

import 'core/presentation/components/button.dart';
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
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: FutureBuilder<List<Recipe>>(
        future: GetSavedRecipesUseCase(
          recipeRepository: FakeRecipeRepositoryImpl(),
          bookmarkRepository: FakeBookmarkRepositoryImpl(),
        ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          print('snapshot.data: ${snapshot.data}');
          final recipes = snapshot.data ?? [];

          return SavedRecipesScreen(recipes: recipes);
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyles.largeTextBold,
        ),
      ),
      body: ListView(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Screens', style: TextStyles.mediumTextBold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Button(
              'Components',
              variant: ButtonVariants.medium,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CompoentsScreen(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Button(
              'Sign in',
              variant: ButtonVariants.medium,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
