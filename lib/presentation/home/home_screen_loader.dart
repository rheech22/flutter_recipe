import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/core/routing/routes.dart';
import 'package:flutter_recipe/presentation/home/home_action.dart';
import 'package:flutter_recipe/presentation/home/home_screen.dart';
import 'package:flutter_recipe/presentation/home/home_view_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreenLoader extends StatefulWidget {
  const HomeScreenLoader({super.key});

  @override
  State<HomeScreenLoader> createState() => _HomeScreenLoaderState();
}

class _HomeScreenLoaderState extends State<HomeScreenLoader> {
  late HomeViewModel viewModel;
  StreamSubscription? _errorSubscription;

  @override
  void initState() {
    super.initState();

    viewModel = getIt<HomeViewModel>();

    _errorSubscription = viewModel.errorStream.listen((error) {
      log(error.toString());

      // NOTE: mounted 이후 실행하도록 보장
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      }
    });
  }

  // NOTE: unmount example
  @override
  void dispose() {
    _errorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (context, widget) {
        return HomeScreen(
          state: viewModel.state,
          onAction: (action) {
            if (action is OnTapSearchField) {
              context.push(Routes.search);
              return;
            }
            viewModel.onAction(action);
          },
        );
      },
      listenable: viewModel,
    );
  }
}
