import 'package:flutter_recipe/core/domain/error/error.dart';

enum NewRecipeError implements BaseError {
  noRecipe,
  invalidCategory,
  unknown;
}
