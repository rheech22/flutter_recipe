import 'dart:async';

import 'package:flutter_recipe/domain/repository/saved_recipes_repository.dart';
import 'package:rxdart/rxdart.dart';

class SavedRecipesRepositoryImpl implements SavedRecipesRepository {
  final Set<int> _ids;
  final _controller = BehaviorSubject<Set<int>>();

  SavedRecipesRepositoryImpl({
    ids = const <int>{},
  }) : _ids = ids {
    _controller.add(ids);
  }

  @override
  Future<List<int>> getSavedRecipeIds() async {
    return _ids.toList();
  }

  @override
  Future<void> clear() async {
    _ids.clear();
    _controller.add(_ids);
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
    _controller.add(_ids);
  }

  @override
  Future<void> unsave(int id) async {
    _ids.remove(id);
    _controller.add(_ids);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unsave(id);
    } else {
      await save(id);
    }
    _controller.add(_ids);
  }

  @override
  Stream<Set<int>> savedRecipeIdsStream() {
    return _controller.stream;
  }
}
