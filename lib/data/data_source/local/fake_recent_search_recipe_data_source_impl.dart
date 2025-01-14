import 'package:flutter_recipe/data/data_source/models/recipe_data_source.dart';
import 'package:flutter_recipe/logger.dart';

final logger = Logger();

class FakeRecentSearchRecipeDataSourceImpl implements RecipeDataSource {
  final _mockData = {
    "recipes": [
      {
        "category": "Indian",
        "id": 1,
        "name": "Traditional spare ribs baked",
        "image":
            "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
        "chef": "Chef John",
        "time": "20 min",
        "rating": 4.0,
        "ingredients": [
          {
            "ingredient": {
              "id": 3,
              "name": "Pork",
              "image":
                  "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
            },
            "amount": 500,
          },
          {
            "ingredient": {
              "id": 9,
              "name": "Onion",
              "image":
                  "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
            },
            "amount": 50,
          },
          {
            "ingredient": {
              "id": 8,
              "name": "Pepper",
              "image":
                  "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
            },
            "amount": 10,
          },
          {
            "ingredient": {
              "id": 1,
              "name": "Tomato",
              "image":
                  "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
            },
            "amount": 100,
          }
        ],
      },
      {
        "id": 3,
        "category": "Chinese",
        "name": "Spicy fried rice mix chicken bali",
        "image":
            "https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg",
        "chef": "Spicy Nelly",
        "time": "20 min",
        "rating": 4.0,
        "ingredients": [
          {
            "ingredient": {
              "id": 6,
              "name": "Chicken",
              "image":
                  "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
            },
            "amount": 200,
          },
          {
            "ingredient": {
              "id": 4,
              "name": "Rice",
              "image":
                  "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
            },
            "amount": 150,
          },
          {
            "ingredient": {
              "id": 1,
              "name": "Tomato",
              "image":
                  "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
            },
            "amount": 100,
          }
        ],
      },
      {
        "id": 7,
        "category": "Italian",
        "name": "Classic Margherita Pizza",
        "image":
            "https://cdn.pixabay.com/photo/2019/05/15/18/56/pizza-4205701_1280.jpg",
        "chef": "Mario Batali",
        "time": "15 min",
        "rating": 4.3,
        "ingredients": [
          {
            "ingredient": {
              "id": 1,
              "name": "Tomato",
              "image":
                  "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
            },
            "amount": 200,
          }
        ],
      },
      {
        "id": 8,
        "category": "Japanese",
        "name": "Sushi Platter",
        "image":
            "https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg",
        "chef": "Jiro Ono",
        "time": "60 min",
        "rating": 4.8,
        "ingredients": [
          {
            "ingredient": {
              "id": 6,
              "name": "Chicken",
              "image":
                  "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
            },
            "amount": 200,
          },
          {
            "ingredient": {
              "id": 4,
              "name": "Rice",
              "image":
                  "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
            },
            "amount": 100,
          }
        ],
      },
      {
        "id": 9,
        "category": "French",
        "name": "French Onion Soup",
        "image":
            "https://cdn.pixabay.com/photo/2016/03/03/16/19/food-1234483_1280.jpg",
        "chef": "Julia Child",
        "time": "40 min",
        "rating": 4.6,
        "ingredients": [
          {
            "ingredient": {
              "id": 9,
              "name": "Onion",
              "image":
                  "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
            },
            "amount": 300,
          }
        ],
      },
    ],
  };

  @override
  Future<List<Map<String, dynamic>>> getRecipes({String? query}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      return _mockData["recipes"]!;
    } catch (e) {
      logger.log(
        'Error getting recipes: $e',
        'FakeRecentSearchRecipeDataSourceImpl.getRecipes',
      );
      rethrow;
    }
  }
}
