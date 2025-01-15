import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:flutter_recipe/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRecipesUseCase _searchRecipeUseCase;
  Timer? _debounce;

  SearchViewModel({
    required SearchRecipesUseCase searchRecipeUseCase,
  }) : _searchRecipeUseCase = searchRecipeUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _searchRecipeUseCase.getRecentSearchRecipes(),
      isLoading: false,
      isSearchResult: false,
    );
    notifyListeners();
  }

  Future<void> _searchRecipes(String query, FilterState? filters) async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final recipes = await _searchRecipeUseCase.search(query, state.filters);

    await _searchRecipeUseCase.updateRecentSearchRecipes(recipes: recipes);

    _state = _state.copyWith(
      recipes: recipes,
      isLoading: false,
      isSearchResult: true,
      query: query,
    );
    notifyListeners();
  }

  void debouncedSearchRecipes(String query) {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(
      Duration(milliseconds: 500),
      () async => await _searchRecipes(query, state.filters),
    );
  }

  void onChangeFilter(FilterState filters) async {
    _state = _state.copyWith(filters: filters);
    await _searchRecipes(state.query, filters);
    notifyListeners();
  }
}
