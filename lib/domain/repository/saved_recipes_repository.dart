abstract interface class SavedRecipesRepository {
  Future<void> save(int id);

  Future<void> unsave(int id);

  Future<void> toggle(int id);

  Future<List<int>> getSavedRecipeIds();

  Stream<Set<int>> savedRecipeIdsStream();

  Future<void> clear();
}
