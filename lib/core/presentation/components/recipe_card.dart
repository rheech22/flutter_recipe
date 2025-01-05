import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/ui/text_styles.dart';
import 'package:flutter_recipe/ui/color_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        // NOTE:: Stack은 childrens를 겹쳐서 표현할 수 있음
        children: [
          AspectRatio(
            // NOTE: 반응형으로 이미지 비율을 유지할 수 있도록 함
            aspectRatio: 315 / 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // NOTE: Stack과 Positioned를 사용하여 위치를 지정할 수 있음
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.name,
                    maxLines: 2,
                    style: TextStyles.smallTextBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'By ${recipe.chef}',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                const Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                ClipOval(
                  // NOTE: ClipOval와 IconButton은 각각 어떤 상황에서 사용하는 것이 좋을까?
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Icons.bookmark_border_outlined,
                      color: ColorStyles.primary80,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 37,
              height: 16,
              decoration: BoxDecoration(
                color: ColorStyles.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: ColorStyles.rating,
                  ),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.smallerTextRegular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
