import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

// NOTE: View에 넘기는 핸들러가 많아지는 경우에 유용할 듯
@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapSearchField() = OnTapSearchField;
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}
