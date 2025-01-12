import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/logger.dart';

final logger = Logger();

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final SavedRecipesRepository _savedRecipesRepository;

  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required SavedRecipesRepository savedRecipesRepository,
  })  : _recipeRepository = recipeRepository,
        _savedRecipesRepository = savedRecipesRepository;

  Future<List<Recipe>> execute() async {
    try {
      final ids = await _savedRecipesRepository.getSavedRecipeIds();
      final recipes = await _recipeRepository.getRecipes();

      return recipes.where((e) => ids.contains(e.id)).toList();
    } catch (e) {
      logger.log('Error getting saved recipes: $e', 'GetSavedRecipesUseCase');
      rethrow;
    }
  }
}
