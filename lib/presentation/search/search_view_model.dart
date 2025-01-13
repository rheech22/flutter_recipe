import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository {
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
}
