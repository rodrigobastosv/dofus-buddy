enum AppRoute {
  home('/'),
  items('/items'),
  recipes('/recipes'),
  sets('/sets'),
  settings('/settings');

  const AppRoute(this.path);

  final String path;
}
