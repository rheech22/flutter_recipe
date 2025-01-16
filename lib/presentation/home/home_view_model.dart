import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/domain/error/error.dart';
import 'package:flutter_recipe/core/domain/error/network_error.dart';
import 'package:flutter_recipe/core/domain/error/new_recipe_error.dart';
import 'package:flutter_recipe/core/domain/error/result.dart';
import 'package:flutter_recipe/core/domain/error/save_recipe_error.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_recipe_categories_use_case.dart';
import 'package:flutter_recipe/domain/use_case/toggle_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/home/home_action.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getdishesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;
  final ToggleSavedRecipesUseCase _toggleSavedRecipesUseCase;

  final _errorStreamController = StreamController<BaseError>.broadcast();

  Stream<BaseError> get errorStream => _errorStreamController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getdishesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
    required ToggleSavedRecipesUseCase toggleSavedRecipesUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getdishesByCategoryUseCase = getdishesByCategoryUseCase,
        _getNewRecipesUseCase = getNewRecipesUseCase,
        _toggleSavedRecipesUseCase = toggleSavedRecipesUseCase {
    _loadCategories();
    _loadNewRecipes();
  }

  HomeState _state = const HomeState(name: 'Aiden');

  HomeState get state => _state;

  void _loadCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = _state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();

        await _loadDishesByCategory(state.selectedCategory);
        notifyListeners();
      case ResultError<List<String>, NetworkError>():
        // NOTE: error handling examples
        // switch (result.error) {
        //   case NetworkError.requestTimeout:
        //   case NetworkError.noInternet:
        //   case NetworkError.serverError:
        //   case NetworkError.unknown:
        // }
        _errorStreamController.add(result.error);
    }
  }

  Future<void> _loadDishesByCategory(String category) async {
    final dishes = await _getdishesByCategoryUseCase.execute(category);
    _state = _state.copyWith(dishes: dishes);
  }

  Future<void> _loadNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<Recipe>, NewRecipeError>():
        _state = _state.copyWith(newRecipes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, NewRecipeError>():
        _errorStreamController.add(result.error);
    }
  }

  void _onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _loadDishesByCategory(category);
    notifyListeners();
  }

  void _onTapFavorite(Recipe recipe) async {
    final result = await _toggleSavedRecipesUseCase.execute(recipe.id);
    switch (result) {
      case ResultSuccess<List<Recipe>, SaveRecipeError>():
        _state = _state.copyWith(dishes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, SaveRecipeError>():
        _errorStreamController.add(result.error);
    }
  }

  void onAction(HomeAction action) async {
    switch (action) {
      case OnTapSearchField():
        return;
      case OnSelectCategory():
        _onSelectCategory(action.category);
      case OnTapFavorite():
        _onTapFavorite(action.recipe);
    }
  }
}
