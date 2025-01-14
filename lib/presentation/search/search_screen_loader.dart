import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/core/presentation/components/search_filter_sheet.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:flutter_recipe/presentation/search/search_screen.dart';
import 'package:flutter_recipe/presentation/search/search_view_model.dart';

class SearchScreenLoader extends StatelessWidget {
  const SearchScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SearchViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.debouncedSearchRecipes,
          onTabFilter: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SearchFilterSheet(
                state: const FilterState(
                  time: "All",
                  rate: 1,
                  category: 'Local Dish',
                ),
                onChangeFilter: (FilterState state) {
                  viewModel.onChangeFilter(state);
                },
              ),
            );
          },
        );
      },
    );
  }
}
