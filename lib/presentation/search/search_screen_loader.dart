import 'package:flutter/material.dart';
import 'package:flutter_recipe/data/data_source/local/fake_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/data_source/local/fake_recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/repository/recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/search/search_screen.dart';
import 'package:flutter_recipe/presentation/search/search_view_model.dart';

final _searchRecipeUseCase = SearchRecipesUseCase(
  recipeRepository: RecipeRepositoryImpl(
    recipeDataSource: FakeRecipeDataSourceImpl(),
  ),
  recentSearchRecipeRepository: RecentSearchRecipeRepositoryImpl(
    recipeDataSource: FakeRecentSearchRecipeDataSourceImpl(),
  ),
);

class SearchScreenLoader extends StatelessWidget {
  const SearchScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      searchRecipeUseCase: _searchRecipeUseCase,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.debouncedSearchRecipes,
        );
      },
    );
  }
}
