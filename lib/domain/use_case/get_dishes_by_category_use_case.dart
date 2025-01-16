import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';

class GetDishesByCategoryUseCase {
  final RecipeRepository _recipeRepository;
  final SavedRecipesRepository _savedRecipesRepository;

  const GetDishesByCategoryUseCase({
    required RecipeRepository recipeRepository,
    required SavedRecipesRepository savedRecipesRepository,
  })  : _recipeRepository = recipeRepository,
        _savedRecipesRepository = savedRecipesRepository;

  Future<List<Recipe>> execute(String category) async {
    final recipes = await _recipeRepository.getRecipes();
    final savedIds = await _savedRecipesRepository.getSavedRecipeIds();

    return recipes
        .where((e) => category == 'All' || e.category == category)
        .map((e) => e.copyWith(isFavorite: savedIds.contains(e.id)))
        .toList();
  }
}
