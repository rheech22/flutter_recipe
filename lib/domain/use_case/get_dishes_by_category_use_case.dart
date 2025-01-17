import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';

class GetDishesByCategoryUseCase {
  final RecipeRepository _recipeRepository;
  final SavedRecipesRepository _savedRecipesRepository;

  GetDishesByCategoryUseCase({
    required RecipeRepository recipeRepository,
    required SavedRecipesRepository savedRecipesRepository,
  })  : _recipeRepository = recipeRepository,
        _savedRecipesRepository = savedRecipesRepository;

  Stream<List<Recipe>> execute(String category) async* {
    final recipes = await _recipeRepository.getRecipes();

    await for (final ids in _savedRecipesRepository.savedRecipeIdsStream()) {
      yield recipes
          .where((e) => category == 'All' || e.category == category)
          .map((e) => e.copyWith(isFavorite: ids.contains(e.id)))
          .toList();
    }
  }
}
