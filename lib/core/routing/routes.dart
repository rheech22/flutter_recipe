abstract class Routes {
  static const String splash = '/Splash';
  static const String signIn = '/SingIn';
  static const String signUp = '/SingUp';
  static const String home = '/Home';
  static const String notifications = '/Notifications';
  static const String profile = '/Profile';
  static const String savedRecipes = '/SavedRecipes';

  // nested
  static const String search = '$home/Search';
  static const String ingredient = '$home/Ingredient/:recipeId';

  // NOTE: DEV ONLY
  static const String components = '/Components';
}
