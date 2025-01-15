import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/logger.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

final logger = Logger();

class FakeRecentSearchRecipeDataSourceImpl implements RecipeDataSource {
  var mockData = {
    "recipes": <Map<String, dynamic>>[],
  };

  @override
  Future<List<Map<String, dynamic>>> getRecipes({
    String? query,
    FilterState? filters,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      return mockData["recipes"]!;
    } catch (e) {
      logger.log(
        'Error getting recipes: $e',
        'FakeRecentSearchRecipeDataSourceImpl.getRecipes',
      );
      rethrow;
    }
  }

  @override
  Future<void> update({required List<Recipe> recipes}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      mockData["recipes"] = recipes.map((r) => r.toJson()).toList();
    } catch (e) {
      logger.log(
        'Error getting recipes: $e',
        'FakeRecentSearchRecipeDataSourceImpl.update',
      );
      rethrow;
    }
  }
}
