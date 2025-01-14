import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String query) async {
    return await _recipeRepository.getRecipes(query: query);
  }
}
