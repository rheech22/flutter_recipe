import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';

class SavedRecipesRepositoryImpl implements SavedRecipesRepository {
  final Set<int> _ids;

  const SavedRecipesRepositoryImpl({
    ids = const <int>{},
  }) : _ids = ids;

  @override
  Future<List<int>> getSavedRecipeIds() async {
    return _ids.toList();
  }

  @override
  Future<void> clear() async {
    _ids.clear();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
  }

  @override
  Future<void> unsave(int id) async {
    _ids.remove(id);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unsave(id);
    } else {
      await save(id);
    }
  }
}
