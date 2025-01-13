import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/routing/routes.dart';
import 'package:flutter_recipe/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreenLoader extends StatelessWidget {
  const HomeScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      name: 'Aiden',
      onTapSearch: () => context.push(Routes.search),
    );
  }
}
