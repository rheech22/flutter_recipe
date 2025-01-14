import 'package:flutter_recipe/domain/model/recipe.dart';

abstract interface class RecipeDataSource {
  Future<List<Map<String, dynamic>>> getRecipes({String? query});

  Future<void> update({required List<Recipe> recipes});
}
