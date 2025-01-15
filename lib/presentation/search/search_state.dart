import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default(false) bool isSearchResult,
    @Default(FilterState(time: 'All', rate: 1, category: 'All'))
    FilterState filters,
    @Default('') String query,
  }) = _SearchState;
}
