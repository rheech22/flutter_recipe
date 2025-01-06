import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';

// NOTE: ChangeNotifier에 대해 공부할 것
class SavedRecipesViewModel extends ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  // NOTE: 처음에 데이터를 가져오고 싶지 않은 경우도 고려해야 할 수 있음
  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    _loadRecipeData();
  }

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _loadRecipeData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    notifyListeners();
  }
}
