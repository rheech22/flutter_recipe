import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/logger.dart';

var logger = Logger();

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  })  : _recipeRepository = recipeRepository,
        _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute() async {
    try {
      final ids = await _bookmarkRepository.getBookmarkedIds();
      final recipes = await _recipeRepository.getRecipes();

      return recipes.where((e) => ids.contains(e.id)).toList();
    } catch (e) {
      logger.log('Error getting saved recipes: $e', 'GetSavedRecipesUseCase');
      rethrow;
    }
  }
}
