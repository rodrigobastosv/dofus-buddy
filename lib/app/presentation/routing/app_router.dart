import 'package:dofus_buddy/app/presentation/pages/home/home_page.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/item_search_page.dart';
import 'package:dofus_buddy/app/presentation/pages/recipes/recipes_page.dart';
import 'package:dofus_buddy/app/presentation/pages/sets/sets_page.dart';
import 'package:dofus_buddy/app/presentation/pages/settings/settings_page.dart';
import 'package:dofus_buddy/app/presentation/routing/app_route.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(path: AppRoute.home.path, name: AppRoute.home.name, builder: (context, state) => const HomePage()),
      GoRoute(path: AppRoute.items.path, name: AppRoute.items.name, builder: (context, state) => const ItemSearchPage()),
      GoRoute(path: AppRoute.recipes.path, name: AppRoute.recipes.name, builder: (context, state) => const RecipesPage()),
      GoRoute(path: AppRoute.sets.path, name: AppRoute.sets.name, builder: (context, state) => const SetsPage()),
      GoRoute(path: AppRoute.settings.path, name: AppRoute.settings.name, builder: (context, state) => const SettingsPage()),
    ],
  );
}
