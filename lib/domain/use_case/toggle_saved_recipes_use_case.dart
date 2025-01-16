import 'package:flutter_recipe/core/domain/error/result.dart';
import 'package:flutter_recipe/core/domain/error/save_recipe_error.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';

class ToggleSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final SavedRecipesRepository _savedRecipesRepository;

  const ToggleSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required SavedRecipesRepository savedRecipesRepository,
  })  : _recipeRepository = recipeRepository,
        _savedRecipesRepository = savedRecipesRepository;

  Future<Result<List<Recipe>, SaveRecipeError>> execute(int recipeId) async {
    try {
      final recipe = await _recipeRepository.getRecipe(recipeId);

      if (recipe == null) {
        return const Result.error(SaveRecipeError.notFound);
      }

      await _savedRecipesRepository.toggle(recipeId);

      final recipes = await _recipeRepository.getRecipes();
      final ids = await _savedRecipesRepository.getSavedRecipeIds();

      return Result.success(
        recipes.map((e) {
          if (ids.contains(e.id)) {
            return e.copyWith(isFavorite: true);
          }
          return e;
        }).toList(),
      );
    } catch (e) {
      return const Result.error(SaveRecipeError.unknown);
    }
  }
}
