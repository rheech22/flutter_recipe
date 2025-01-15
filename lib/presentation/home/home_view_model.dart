import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/domain/error/network_error.dart';
import 'package:flutter_recipe/core/domain/error/result.dart';
import 'package:flutter_recipe/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_recipe_categories_use_case.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getdishesByCategoryUseCase;

  final _errorStreamController = StreamController<NetworkError>.broadcast();

  Stream<NetworkError> get errorStream => _errorStreamController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getdishesByCategoryUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getdishesByCategoryUseCase = getdishesByCategoryUseCase {
    _loadCategories();
  }

  HomeState _state = const HomeState();

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

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _loadDishesByCategory(category);
    notifyListeners();
  }
}
