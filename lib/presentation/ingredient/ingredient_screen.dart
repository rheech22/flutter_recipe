import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/chef_profile.dart';
import 'package:flutter_recipe/core/presentation/components/ingredient_item.dart';
import 'package:flutter_recipe/core/presentation/components/ingredient_recipe_card.dart';
import 'package:flutter_recipe/core/presentation/components/procedure_item.dart';
import 'package:flutter_recipe/core/presentation/components/tablist.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_state.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientState state;
  final void Function(IngredientAction action) onAction;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              IngredientRecipeCard(
                recipe: state.recipe!,
                onTapFavorite: (recipe) {},
              ),
              const SizedBox(height: 10),
              const ChefProfile(),
              const SizedBox(height: 20),
              Tablist(
                initialIndex: state.selectedTabIndex,
                labels: ['Ingredients', 'Procedures'],
                onPressed: (index) {
                  if (index == 0) {
                    onAction(const IngredientAction.onTapIngredient());
                  } else {
                    onAction(const IngredientAction.onTapProcedure());
                  }
                },
              ),
              const SizedBox(height: 35),
              // NOTE: 조건부 리스트 표출
              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: [
                    IngredientList(state: state),
                    ProcedureList(state: state),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcedureList extends StatelessWidget {
  final IngredientState state;

  const ProcedureList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(width: 5),
            Text(
              '${state.procedures.length} Steps',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.procedures.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProcedureItem(
                    procedure: state.procedures[index],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientList extends StatelessWidget {
  final IngredientState state;

  const IngredientList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.room_service,
              size: 17,
              color: ColorStyles.gray3,
            ),
            const SizedBox(width: 5),
            Text(
              '1 Serve',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 23.5),
        Expanded(
          // NOTE: 리스트 부분 스크롤
          child: ListView.builder(
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientItem(
                    ingredient: state.ingredients[index],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
