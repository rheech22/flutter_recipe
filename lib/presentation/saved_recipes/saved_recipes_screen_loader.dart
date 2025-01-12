import 'package:flutter/material.dart';
import 'package:flutter_recipe/data/data_source/local/fake_recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/repository/saved_recipes_repository_impl.dart';
import 'package:flutter_recipe/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';

// NOTE: make an instance as a singleton on top level
final GetSavedRecipesUseCase _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: RecipeRepositoryImpl(
    recipeDataSource: FakeRecipeDataSourceImpl(),
  ),
  savedRecipesRepository: SavedRecipesRepositoryImpl(ids: {2, 4}),
);

// NOTE: loader는 스크린과 뷰모델을 연결하고 의존성 주입
class SavedRecipesScreenLoader extends StatelessWidget {
  const SavedRecipesScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        SavedRecipesViewModel(getSavedRecipesUseCase: _getSavedRecipesUseCase);

    // NOTE: ListenableBuilder에 대해 공부할 것
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(recipes: state.recipes);
      },
    );
  }
}
