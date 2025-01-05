import 'package:flutter_recipe/domain/model/ingredient.dart';
import 'package:flutter_recipe/domain/model/recipe_ingredient.dart';

class Recipe {
  final int id;
  final String name;
  final String category;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<Ingredient> ingredients;

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
    return Recipe(
      category: json['category'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      chef: json['chef'] as String,
      time: json['time'] as String,
      rating: json['rating'].toDouble(),
      ingredients:
          json['ingredients'].map((e) => RecipeIngredient.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
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
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, category: $category,  chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
  }
}
