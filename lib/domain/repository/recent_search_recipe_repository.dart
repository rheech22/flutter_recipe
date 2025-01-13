import 'package:flutter_recipe/domain/model/recipe.dart';

abstract interface class RecentSearchRecipeRepository {
  Future<List<Recipe>> getRecentSearchRecipes();

  Future<void> updateRecentSearchRecipes(List<Recipe> recipes);
}
