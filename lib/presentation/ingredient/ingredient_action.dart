import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  const factory IngredientAction.onTapIngredient() = OnTapIngredient;
  const factory IngredientAction.onTapProcedure() = OnTapProcedure;
  const factory IngredientAction.onTapFollow(Recipe recipe) = OnTapFollow;
  const factory IngredientAction.loadRecipe(int recipeId) = LoadRecipe;
  const factory IngredientAction.onCopyToShare(String link) = OnCopyToShare;
  const factory IngredientAction.onRateRecipe(Recipe recipe, int rate) =
      OnRateRecipe;
  const factory IngredientAction.onTapUnsave(Recipe recipe) = OnTapUnsave;
}
