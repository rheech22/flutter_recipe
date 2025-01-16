import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<String> categories,
    @Default('All') String selectedCategory,
    @Default([]) List<Recipe> dishes,
    @Default([]) List<Recipe> newRecipes,
    @Default('') String name,
  }) = _HomeState;
}
