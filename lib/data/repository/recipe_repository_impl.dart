import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/logger.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

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
  Future<List<Recipe>> getRecipes({String? query, FilterState? filters}) async {
    try {
      final recipes =
          await _recipeDataSource.getRecipes(query: query, filters: filters);
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
