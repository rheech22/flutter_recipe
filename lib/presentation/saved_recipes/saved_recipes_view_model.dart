import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/domain/use_case/toggle_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_state.dart';

// NOTE: ChangeNotifier에 대해 공부할 것
class SavedRecipesViewModel extends ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleSavedRecipesUseCase _toggleSavedRecipesUseCase;

  StreamSubscription? _streamSubscription;
  // NOTE: use state holder
  SavedRecipesState _state = SavedRecipesState();
  SavedRecipesState get state => _state;

  // NOTE: 처음에 데이터를 가져오고 싶지 않은 경우도 고려해야 할 수 있음
  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required ToggleSavedRecipesUseCase toggleSavedRecipesUseCase,
  })  : _getSavedRecipesUseCase = getSavedRecipesUseCase,
        _toggleSavedRecipesUseCase = toggleSavedRecipesUseCase {
    _streamSubscription = _getSavedRecipesUseCase.execute().listen((recipes) {
      _state = state.copyWith(recipes: recipes);
      notifyListeners();
    });
  }

  void _onTapFavorite(int recipeId) async {
    await _toggleSavedRecipesUseCase.execute(recipeId);
  }

  void onAction(SavedRecipesAction action) async {
    switch (action) {
      case OnTapFavorite():
        _onTapFavorite(action.recipe.id);
      case OnTapRecipe():
      // TODO: implement
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
