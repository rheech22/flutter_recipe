import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_recipe_categories_use_case.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getdishesByCategoryUseCase;

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
    _state = _state.copyWith(
      categories: await _getCategoriesUseCase.execute(),
      selectedCategory: 'All',
    );
    notifyListeners();

    await _loadDishesByCategory(state.selectedCategory);
    notifyListeners();
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
