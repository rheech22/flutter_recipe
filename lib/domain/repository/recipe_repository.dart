import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes({String? query, FilterState? filters});

  Future<Recipe?> getRecipe(int id);
}
