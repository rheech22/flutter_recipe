import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  })  : _recipeRepository = recipeRepository,
        _recentSearchRecipeRepository = recentSearchRecipeRepository;

  Future<List<Recipe>> search(String query, FilterState? filters) async {
    return await _recipeRepository.getRecipes(query: query, filters: filters);
  }

  Future<List<Recipe>> getRecentSearchRecipes() async {
    return await _recentSearchRecipeRepository.getRecentSearchRecipes();
  }

  Future<void> updateRecentSearchRecipes({
    required List<Recipe> recipes,
  }) async {
    return await _recentSearchRecipeRepository.updateRecentSearchRecipes(
      recipes = recipes,
    );
  }
}
