import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/logger.dart';

final logger = Logger();

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    try {
      await Future.delayed(const Duration(microseconds: 500));

      final recipes = await getRecipes();
      return recipes.where((r) => r.id == id).firstOrNull;
    } catch (e) {
      logger.log(
        'Error getting recipe: $e',
        'RecipeRepositoryImpl.getRecipe',
      );
      rethrow;
    }
  }

  @override
  Future<List<Recipe>> getRecipes({String? query}) async {
    try {
      final recipes = await _recipeDataSource.getRecipes(query: query);
      return recipes.map((r) => Recipe.fromJson(r)).toList();
    } catch (e) {
      logger.log(
        'Error getting recipes: $e',
        'RecipeRepositoryImpl.getRecipes',
      );
      rethrow;
    }
  }
}
