import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/core/routing/routes.dart';
import 'package:flutter_recipe/presentation/home/home_screen.dart';
import 'package:flutter_recipe/presentation/home/home_view_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreenLoader extends StatelessWidget {
  const HomeScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();

    return ListenableBuilder(
      builder: (context, widget) {
        return HomeScreen(
          state: viewModel.state,
          name: 'Aiden',
          onTapSearch: () => context.push(Routes.search),
          onSelectCategory: viewModel.onSelectCategory,
        );
      },
      listenable: viewModel,
    );
  }
}
