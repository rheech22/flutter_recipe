import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipeUseCase;
  Timer? _debounce;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipeUseCase,
  })  : _recentSearchRecipeRepository = recentSearchRecipeRepository,
        _searchRecipeUseCase = searchRecipeUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void _searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _searchRecipeUseCase.execute(query),
      isLoading: false,
    );
    notifyListeners();
  }

  void debouncedSearchRecipes(String query) {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(
      Duration(milliseconds: 500),
      () => _searchRecipes(query),
    );
  }
}
