// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dofus Buddy';

  @override
  String get homeTagline => 'An unofficial companion for Dofus players.';

  @override
  String get homeAttribution => 'Data provided by the public dofusdu.de API. This app has no official affiliation with Ankama.';

  @override
  String get itemsFeatureTitle => 'Items';

  @override
  String get itemsFeatureSubtitle => 'Search items, weapons and equipment';

  @override
  String get recipesFeatureTitle => 'Recipes';

  @override
  String get recipesFeatureSubtitle => 'Discover crafting recipes';

  @override
  String get setsFeatureTitle => 'Sets';

  @override
  String get setsFeatureSubtitle => 'Build the best equipment sets';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguageLabel => 'Language';

  @override
  String get languageSystemDefault => 'System default';

  @override
  String get languageEnglish => 'English';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get languageFrench => 'French';

  @override
  String get settingsThemeLabel => 'Theme';

  @override
  String get themeSystemDefault => 'System default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get itemSearchHint => 'Search item, e.g. Atcham';

  @override
  String get itemSearchInitialTitle => 'Find your items';

  @override
  String get itemSearchInitialMessage => 'Type the name of a Dofus item to start searching.';

  @override
  String get itemSearchEmptyTitle => 'No items found';

  @override
  String get itemSearchEmptyMessage => 'Try searching with a different term.';

  @override
  String itemLevelLabel(int level) {
    return 'Level $level';
  }

  @override
  String get retryButtonLabel => 'Try again';

  @override
  String get errorNetworkMessage => 'No internet connection.';

  @override
  String get errorGenericMessage => 'Something went wrong. Please try again.';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get recipesComingSoonMessage => 'Crafting recipe search is on its way.';

  @override
  String get setsComingSoonMessage => 'Equipment set search is on its way.';
}
