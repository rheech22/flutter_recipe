import 'package:flutter/material.dart';
import 'package:flutter_recipe/data/repository/fake_bookmark_repository_impl.dart';
import 'package:flutter_recipe/data/repository/fake_recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';

// NOTE: make an instance as a singleton on top level
final GetSavedRecipesUseCase _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: FakeRecipeRepositoryImpl(),
  bookmarkRepository: FakeBookmarkRepositoryImpl(),
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
        if (viewModel.state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(recipes: viewModel.state.recipes);
      },
    );
  }
}
