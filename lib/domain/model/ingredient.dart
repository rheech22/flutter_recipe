import 'package:flutter_recipe/logger.dart';

final logger = Logger();

class Ingredient {
  final int id;
  final String name;
  final String image;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    try {
      return Ingredient(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
    } catch (e) {
      logger.log('Error parsing Ingredient: $e', 'Ingredient.fromJson');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'id': id,
        'name': name,
        'image': image,
      };
    } catch (e) {
      logger.log(
        'Error converting Ingredient to JSON: $e',
        'Ingredient.toJson',
      );
      rethrow;
    }
  }

  @override
  String toString() {
    try {
      return 'Ingredient(id: $id, name: $name, image: $image)';
    } catch (e) {
      logger.log(
        'Error converting Ingredient to String: $e',
        'Ingredient.toString',
      );
      rethrow;
    }
  }
}
