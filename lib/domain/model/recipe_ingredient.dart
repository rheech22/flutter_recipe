import 'package:flutter_recipe/domain/model/ingredient.dart';
import 'package:flutter_recipe/logger.dart';

var logger = Logger();

class RecipeIngredient {
  final Ingredient ingredient;
  final int amount;

  RecipeIngredient({
    required this.ingredient,
    required this.amount,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    try {
      return RecipeIngredient(
        ingredient: Ingredient.fromJson(json['ingredient']),
        amount: json['amount'],
      );
    } catch (e) {
      logger.log(
        'Error parsing RecipeIngredient: $e',
        'RecipeIngredient.fromJson',
      );
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'ingredient': ingredient.toJson(),
        'amount': amount,
      };
    } catch (e) {
      logger.log(
        'Error converting RecipeIngredient to JSON: $e',
        'RecipeIngredient.toJson',
      );
      rethrow;
    }
  }

  @override
  String toString() {
    try {
      return 'RecipeIngredient(ingredient: $ingredient, amount: $amount)';
    } catch (e) {
      logger.log(
        'Error converting RecipeIngredient to String: $e',
        'RecipeIngredient.toString',
      );
      rethrow;
    }
  }
}
