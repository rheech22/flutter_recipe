abstract interface class BookmarkRepository {
  Future<void> save(int id);

  Future<void> unsave(int id);

  Future<void> toggle(int id);

  Future<List<int>> getBookmarkedIds();

  Future<void> clear();
}
