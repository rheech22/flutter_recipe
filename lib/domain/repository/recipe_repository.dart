import 'package:flutter_recipe/domain/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes({String? query});

  Future<Recipe?> getRecipe(int id);
}
