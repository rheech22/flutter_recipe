import 'package:flutter_recipe/data/data_source/local/fake_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/data_source/local/fake_recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/data/repository/recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe/data/repository/saved_recipes_repository_impl.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';
import 'package:flutter_recipe/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_recipe_categories_use_case.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/domain/use_case/toggle_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/home/home_view_model.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe/presentation/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Data Sources
  getIt.registerSingleton<RecipeDataSource>(FakeRecipeDataSourceImpl());
  getIt.registerSingleton<FakeRecentSearchRecipeDataSourceImpl>(
    FakeRecentSearchRecipeDataSourceImpl(),
  );

  // Repositories
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(
      recipeDataSource: getIt<RecipeDataSource>(),
    ),
  );
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    RecentSearchRecipeRepositoryImpl(
      recipeDataSource: getIt<FakeRecentSearchRecipeDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SavedRecipesRepository>(
    SavedRecipesRepositoryImpl(
      ids: {2, 3},
    ),
  );

  // Use Cases
  getIt.registerSingleton<SearchRecipesUseCase>(
    SearchRecipesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
      recentSearchRecipeRepository: getIt<RecentSearchRecipeRepository>(),
    ),
  );
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
      savedRecipesRepository: getIt<SavedRecipesRepository>(),
    ),
  );
  getIt.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
    ),
  );
  getIt.registerSingleton<GetDishesByCategoryUseCase>(
    GetDishesByCategoryUseCase(
      recipeRepository: getIt<RecipeRepository>(),
      savedRecipesRepository: getIt<SavedRecipesRepository>(),
    ),
  );
  getIt.registerSingleton<GetNewRecipesUseCase>(
    GetNewRecipesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
    ),
  );

  getIt.registerSingleton<ToggleSavedRecipesUseCase>(
    ToggleSavedRecipesUseCase(
      recipeRepository: getIt<RecipeRepository>(),
      savedRecipesRepository: getIt<SavedRecipesRepository>(),
    ),
  );
  // View Models
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt<GetSavedRecipesUseCase>(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      searchRecipeUseCase: getIt<SearchRecipesUseCase>(),
    ),
  );
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getdishesByCategoryUseCase: getIt<GetDishesByCategoryUseCase>(),
      getNewRecipesUseCase: getIt<GetNewRecipesUseCase>(),
      toggleSavedRecipesUseCase: getIt<ToggleSavedRecipesUseCase>(),
    ),
  );
}
