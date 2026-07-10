# Dofus Buddy

Companion app for Dofus players. Consumes the public [dofusdu.de](https://docs.dofusdu.de) API. Flutter, SDK ^3.10.7. No official affiliation with Ankama.

## Architecture

Clean Architecture, without repository/datasource interfaces and without a separate data-model layer — one concrete class per responsibility, no `Impl` suffixes:

```
lib/app/
  core/            Env, http client (dio + DBHttpClient), Result/DBError, DI (get_it), logging
  data/<feature>/   Repository (concrete class), datasources/, datasources/requests/
  domain/<feature>/ Entities (also the JSON models — @JsonSerializable directly on them), use cases (plain classes with a `call` method)
  design_system/    DB-prefixed tokens, themes and components
  presentation/     Pages (Cubit + DBPage), routing
```

Entities double as the wire format: `Item`, `TranslatedId`, `ItemSubtype` and `ItemImages` (`lib/app/domain/items/entities/`) are `@JsonSerializable` with a `fromJson` factory, generated via `build_runner` straight into the entity file's `part '<file>.g.dart'`. There is no `data/<feature>/models/` directory and no `toEntity()` mapping step — a datasource parses the API response directly into the entity (`Item.fromJson`). Only add a separate model when a feature's wire format and domain shape genuinely diverge; don't reintroduce the mapping layer preemptively.

A domain use case depends directly on the concrete repository class from `data/`:

```dart
class SearchItemsUseCase {
  SearchItemsUseCase({required ItemsRepository itemsRepository}) : _itemsRepository = itemsRepository;
  final ItemsRepository _itemsRepository;
  Future<Result<DBError, List<Item>>> call({required String query}) => _itemsRepository.searchItems(query: query);
}
```

## Dependency injection

`GetIt.instance` is aliased as `G` (`lib/app/core/di/dependencies.dart`). Register dependencies in `setupDependencies()`, called once from `main()`. Resolve with `G<Type>()`.

## Networking

Endpoints are request objects, not inline `dio` calls. `DBBaseHttpRequest` (`lib/app/core/http/db_base_http_request.dart`) declares `path`, `method`, `body`, `queryParameters`, `headers`; `DBHttpRequest` (`db_http_request.dart`) gives them all empty/null defaults so a concrete request only overrides what it needs. Each endpoint gets its own class next to the datasource that uses it, e.g. `lib/app/data/items/datasources/requests/search_items_request.dart`:

```dart
class SearchItemsRequest extends DBHttpRequest {
  SearchItemsRequest({required this.query, required this.limit});
  final String query;
  final int limit;

  @override
  String get path => '/${Env.game}/v1/${Env.defaultLanguage}/items/search';
  @override
  HttpMethod get method => .get;
  @override
  Map<String, dynamic> get queryParameters => {'query': query, 'limit': limit};
}
```

`DBHttpClient` (`lib/app/core/http/db_http_client.dart`) wraps `dio` with a single `request(DBBaseHttpRequest request)` method and returns `Result<DBError, dynamic>`. `DBError` (`lib/app/core/error/error.dart`) is a sealed class (`NetworkError`, `ApiError`, `UnknownError`) — its `message` is for logs only, never shown directly to the user. Pages map the `DBError` type to a localized string themselves (see `ItemSearchPage._failureMessage`). It's named `DBError` rather than `Error` specifically to avoid colliding with `dart:core`'s `Error` (programming-bug errors, not recoverable failures) everywhere it's imported alongside `Result`.

`Result<F, S>`'s failure branch is `Failed<F, S>` (not `Error`, for the same collision reason) — `Success(value: ...)` / `Failed(failure: ...)`.

## State management

`flutter_bloc` Cubits. Pages use `DBPage<C, S>` (`lib/app/presentation/general/db_page.dart`), mirroring the mobile-app's `PJPage`: it wires `BlocBuilder` and hands the cubit + state straight to the builder, so pages never call `context.read` for their own cubit inside `build`.

## Design system

Everything under `lib/app/design_system` is prefixed `DB` (`DBColors`, `DBSpacing`, `DBRadius`, `DBTextStyles`, `DBTheme`, `DBGap`, `DBCard`, `DBPrimaryButton`, `DBNetworkImage`, `DBSearchField`, `DBEmptyState`, `DBErrorState`, `DBLoadingIndicator`, `DBFeatureTile`) so design-system pieces are always identifiable at a glance. Never use raw Material spacing/colors/text styles in a page when a `DB` token or component exists — add one if it's missing instead of reaching for `SizedBox`/`Colors.*` directly.

Palette: amber/bronze primary, deep purple secondary (warm fantasy tone). Typography: Baloo 2 for headings, Nunito for body text (both via `google_fonts`).

## Navigation

No bottom nav bar — `HomePage` (`/`) is the single entrypoint: a settings action in the `AppBar` plus a grid of `DBFeatureTile`s (one per feature) that push their feature route. Each feature page owns its own `Scaffold`/`AppBar`; there is no shared shell.

Routes are never referenced by raw path string outside of `app_router.dart`. `AppRoute` (`lib/app/presentation/routing/app_route.dart`) is an enum pairing each route's name with its path; `GoRoute`s are declared with both `path: route.path` and `name: route.name`. Elsewhere, navigate with the `BuildContext` extension in `lib/app/core/navigation/navigation_extensions.dart`: `context.pushRoute(.items)` / `context.goRoute(.settings)`, optionally with `extra:` for arguments. Add a new feature by adding a case to `AppRoute`, a `GoRoute` in `app_router.dart`, and a tile to `HomePage`.

This mirrors the mobile-app's `PJRoute`/`pushRoute` pattern, minus its per-route-class abstraction (`BasePJRoute`, custom transitions, redirects) — add that layer only if routes actually need nested children, redirects, or non-default transitions; a flat route list is enough while every route is a single top-level page.

## App-level state

`AppCubit` (`lib/app/cubit/app_cubit.dart`) holds cross-cutting app state — currently just the locale override (`AppState.locale`, null = follow system). It's a GetIt singleton provided once at the root in `main.dart` via `BlocProvider.value(value: G<AppCubit>(), ...)` wrapping `MaterialApp.router`, so any page can reach it with `context.read<AppCubit>()`. `SettingsPage` is its only consumer today, changing the locale through a `RadioGroup<Locale?>`. The choice is in-memory only — it resets on app restart until local persistence is added.

## Internationalization

Standard Flutter `gen-l10n` (not a custom solution). ARB files live in `lib/l10n/arb/` (`app_en.arb` is the template, plus `app_pt.arb`, `app_fr.arb`). Never hardcode user-facing strings — add a key to all three ARB files and read it via `AppLocalizations.of(context)`. Run `flutter gen-l10n` (or `flutter pub get`, which triggers it) after editing an ARB file.

## Code style

- No comments. Code must be self-explanatory through naming; if it isn't, restructure it rather than annotate it.
- No variables named `result` (or similarly generic — `data`, `response`, `value` as a local var name). Name it after what it actually holds: `searchResult`, `searchResponse`, `rawItems`. Prefer destructuring the value straight out of a pattern (`Success(value: final items)`) over binding the whole `Result` to a throwaway name first.
- Use the dot-shorthand operator wherever the target type is inferable (`.center`, `.w700`, `.light`), matching the mobile-app codebase's style.
- `flutter analyze` must report zero issues (including `info`-level lints) before considering a change done.
- Lint rules are the explicit list in `analysis_options.yaml`, carried over from the mobile-app project.

## Testing

Mirrors `lib/`. No `late` variables — build dependencies inline or through factories.

- `test/mocks/`: one file per layer (`repositories_mocks.dart`, `use_cases_mocks.dart`, ...), each a one-line `class MockX extends Mock implements X {}`.
- `test/factories/`: builders with sensible defaults and named-optional overrides, e.g. `ItemFactory.create(level: 250)`. Entity factories live in `test/factories/entities/`; use case and cubit factories in `test/factories/use_cases_factories.dart` / `cubits_factories.dart`, wiring mocks as defaults.
- Cubits: `bloc_test`'s `blocTest`, building the cubit (and any mocks it needs) inside `build:`.

## Growing this file

This file is intentionally thin right now — it covers only what exists (the item search feature). Add a section whenever a new pattern is established (a second feature, local persistence, a new design-system category, etc.) instead of letting the convention live only in code.
