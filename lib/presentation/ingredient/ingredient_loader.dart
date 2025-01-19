import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/core/presentation/components/rating_dialog.dart';
import 'package:flutter_recipe/core/presentation/components/share_dialog.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe/presentation/ingredient/ingredient_screen.dart';

import 'ingredient_view_model.dart';

class IngredientLoader extends StatelessWidget {
  final int recipeId;

  const IngredientLoader({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    // NOTE: 초기 데이터 로드 from params
    final viewModel = getIt<IngredientViewModel>();
    viewModel.onAction(IngredientAction.loadRecipe(recipeId));

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return viewModel.state.recipe == null
            ? const Center(child: CircularProgressIndicator())
            : IngredientScreen(
                state: viewModel.state,
                onAction: viewModel.onAction,
                onTapMenu: (menu) {
                  // NOTE: ViewModel Aciton에서 처리하기 어려운 case 예시
                  // NOTE: callback을 전달하는 방식도 가능할까?
                  switch (menu) {
                    case IngredientMenu.share:
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShareDialog(
                            link: 'app.Recipe.co/jollof_rice',
                            onTapCopyLink: (link) {
                              viewModel.onAction(
                                IngredientAction.onCopyToShare(link),
                              );
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Link copied to clipboard',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          );
                        },
                      );
                    case IngredientMenu.rate:
                      showDialog(
                        context: context,
                        builder: (context) {
                          return RatingDialog(
                            initialRating: 3,
                            onSendPressed: (rating) {
                              viewModel.onAction(
                                IngredientAction.onRateRecipe(
                                  viewModel.state.recipe!,
                                  rating,
                                ),
                              );
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    case IngredientMenu.review:
                      break;
                    case IngredientMenu.unsave:
                      break;
                  }
                },
              );
      },
    );
  }
}
