import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

abstract interface class RecipeDataSource {
  Future<List<Map<String, dynamic>>> getRecipes({
    String? query,
    FilterState? filters,
  });

  Future<void> update({required List<Recipe> recipes});
}
