import 'package:flutter_recipe/domain/model/recipe_ingredient.dart';
import 'package:flutter_recipe/logger.dart';

var logger = Logger();

class Recipe {
  final int id;
  final String name;
  final String category;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  const Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    try {
      return Recipe(
        category: json['category'],
        id: json['id'],
        name: json['name'],
        image: json['image'],
        chef: json['chef'],
        time: json['time'],
        rating: json['rating'].toDouble(),
        ingredients: (json['ingredients'] as List<dynamic>)
            .map((e) => RecipeIngredient.fromJson(e))
            .toList(),
      );
    } catch (e) {
      logger.log('Error parsing Recipe: $e', 'Recipe.fromJson');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'id': id,
        'name': name,
        'category': category,
        'image': image,
        'chef': chef,
        'time': time,
        'rating': rating,
        'ingredients':
            ingredients.map((ingredient) => ingredient.toJson()).toList(),
      };
    } catch (e) {
      logger.log('Error converting Recipe to JSON: $e', 'Recipe.toJson');
      rethrow;
    }
  }

  @override
  String toString() {
    try {
      return 'Recipe(id: $id, name: $name, category: $category,  chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
    } catch (e) {
      logger.log('Error converting Recipe to String: $e', 'Recipe.toString');
      rethrow;
    }
  }
}
