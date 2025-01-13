import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';

class RecentSearchRecipeRepositoryImpl implements RecentSearchRecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const RecentSearchRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();
    return recipes.map((r) => Recipe.fromJson(r)).toList();
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) {
    // TODO: implement updateRecentSearchRecipes
    throw UnimplementedError();
  }
}
