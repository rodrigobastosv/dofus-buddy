import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('fr'), Locale('pt')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dofus Buddy'**
  String get appTitle;

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'An unofficial companion for Dofus players.'**
  String get homeTagline;

  /// No description provided for @homeAttribution.
  ///
  /// In en, this message translates to:
  /// **'Data provided by the public dofusdu.de API. This app has no official affiliation with Ankama.'**
  String get homeAttribution;

  /// No description provided for @itemsFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get itemsFeatureTitle;

  /// No description provided for @itemsFeatureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Search items, weapons and equipment'**
  String get itemsFeatureSubtitle;

  /// No description provided for @recipesFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get recipesFeatureTitle;

  /// No description provided for @recipesFeatureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover crafting recipes'**
  String get recipesFeatureSubtitle;

  /// No description provided for @setsFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get setsFeatureTitle;

  /// No description provided for @setsFeatureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Build the best equipment sets'**
  String get setsFeatureSubtitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageLabel;

  /// No description provided for @languageSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystemDefault;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get languagePortuguese;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @itemSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search item, e.g. Atcham'**
  String get itemSearchHint;

  /// No description provided for @itemSearchInitialTitle.
  ///
  /// In en, this message translates to:
  /// **'Find your items'**
  String get itemSearchInitialTitle;

  /// No description provided for @itemSearchInitialMessage.
  ///
  /// In en, this message translates to:
  /// **'Type the name of a Dofus item to start searching.'**
  String get itemSearchInitialMessage;

  /// No description provided for @itemSearchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get itemSearchEmptyTitle;

  /// No description provided for @itemSearchEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Try searching with a different term.'**
  String get itemSearchEmptyMessage;

  /// Shown next to an item's type in the search results list
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String itemLevelLabel(int level);

  /// No description provided for @retryButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryButtonLabel;

  /// No description provided for @errorNetworkMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get errorNetworkMessage;

  /// No description provided for @errorGenericMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGenericMessage;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoonTitle;

  /// No description provided for @recipesComingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'Crafting recipe search is on its way.'**
  String get recipesComingSoonMessage;

  /// No description provided for @setsComingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'Equipment set search is on its way.'**
  String get setsComingSoonMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
