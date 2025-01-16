import 'package:flutter_recipe/core/domain/error/new_recipe_error.dart';
import 'package:flutter_recipe/core/domain/error/result.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';

import '../repository/recipe_repository.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetNewRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NewRecipeError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return const Result.error(NewRecipeError.noRecipe);
      }

      if (recipes.any((e) => e.category.isEmpty)) {
        return const Result.error(NewRecipeError.invalidCategory);
      }

      return Result.success(recipes.take(5).toList());
    } catch (e) {
      return const Result.error(NewRecipeError.unknown);
    }
  }
}
