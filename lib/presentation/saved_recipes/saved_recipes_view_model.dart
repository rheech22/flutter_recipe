import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_state.dart';

// NOTE: ChangeNotifier에 대해 공부할 것
class SavedRecipesViewModel extends ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  // NOTE: 처음에 데이터를 가져오고 싶지 않은 경우도 고려해야 할 수 있음
  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    _loadRecipeData();
  }

  // NOTE: use state holder
  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  void _loadRecipeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: true,
    );
    notifyListeners();
  }
}
