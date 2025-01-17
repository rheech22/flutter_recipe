import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenLoader extends StatelessWidget {
  const SavedRecipesScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SavedRecipesViewModel>();

    // NOTE: ListenableBuilder에 대해 공부할 것
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(
          recipes: state.recipes,
          onAction: (action) {
            viewModel.onAction(action);
          },
        );
      },
    );
  }
}
