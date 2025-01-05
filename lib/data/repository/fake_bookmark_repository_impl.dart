import 'package:flutter_recipe/domain/repository/bookmark_repository.dart';

class FakeBookmarkRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{2, 4};

  @override
  Future<void> clear() async {
    return _ids.clear();
  }

  @override
  Future<List<int>> getBookmarkedIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }
  }

  @override
  Future<void> unsave(int id) async {
    _ids.remove(id);
  }
}
