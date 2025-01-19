import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_screen.dart';

import 'ingredient_view_model.dart';

class IngredientLoader extends StatelessWidget {
  final int recipeId;

  const IngredientLoader({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    // NOTE: 초기 데이터 로드 from params
    final viewModel = getIt<IngredientViewModel>();
    viewModel.onAction(IngredientAction.loadRecipe(recipeId));

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return viewModel.state.recipe == null
            ? const Center(child: CircularProgressIndicator())
            : IngredientScreen(
                state: viewModel.state,
                onAction: viewModel.onAction,
              );
      },
    );
  }
}
