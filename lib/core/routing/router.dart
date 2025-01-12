import 'package:flutter_recipe/core/routing/navigator_layout.dart';
import 'package:flutter_recipe/core/routing/routes.dart';
import 'package:flutter_recipe/presentation/dev_only/components_screen.dart';
import 'package:flutter_recipe/presentation/home/home_screen.dart';
import 'package:flutter_recipe/presentation/notifications/notifications_screen.dart';
import 'package:flutter_recipe/presentation/profile/profile_screen.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_screen_loader.dart';
import 'package:flutter_recipe/presentation/signin/signin_screen.dart';
import 'package:flutter_recipe/presentation/signup/signup_screen.dart';
import 'package:flutter_recipe/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(Routes.signIn),
      ),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SigninScreen(
        onTapSignIn: () => context.go(Routes.home),
        onTabSignUp: () => context.go(Routes.signUp),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(Routes.signIn),
      ),
    ),
    // NOTE: Dev Only
    GoRoute(
      path: Routes.components,
      builder: (context, state) => CompoentsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigatorLayout(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(name: 'Aiden'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) => const SavedRecipesScreenLoader(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              builder: (context, state) => const NotificationsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
