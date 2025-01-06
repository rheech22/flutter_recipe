import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/routing/routes.dart';
import 'package:flutter_recipe/data/repository/fake_bookmark_repository_impl.dart';
import 'package:flutter_recipe/data/repository/fake_recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/dev_only/components_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe/presentation/signin/signin_screen.dart';
import 'package:flutter_recipe/presentation/signup/signup_screen.dart';
import 'package:flutter_recipe/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(Routes.signIn),
      ),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SigninScreen(
        onTapSignIn: () => context.go(Routes.savedRecipes),
        onTabSignUp: () => context.go(Routes.signUp),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(Routes.signIn),
      ),
    ),
    GoRoute(
      path: Routes.savedRecipes,
      builder: (context, state) => FutureBuilder<List<Recipe>>(
        future: GetSavedRecipesUseCase(
          recipeRepository: FakeRecipeRepositoryImpl(),
          bookmarkRepository: FakeBookmarkRepositoryImpl(),
        ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final recipes = snapshot.data ?? [];
          return SavedRecipesScreen(recipes: recipes);
        },
      ),
    ),
    // NOTE: Dev Only
    GoRoute(
      path: Routes.components,
      builder: (context, state) => CompoentsScreen(),
    ),
  ],
);
