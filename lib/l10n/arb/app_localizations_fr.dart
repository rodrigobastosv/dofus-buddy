// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Dofus Buddy';

  @override
  String get homeTagline => 'Un compagnon non officiel pour les joueurs de Dofus.';

  @override
  String get homeAttribution =>
      'Données fournies par l\'API publique dofusdu.de. Cette application n\'a aucune affiliation officielle avec Ankama.';

  @override
  String get itemsFeatureTitle => 'Objets';

  @override
  String get itemsFeatureSubtitle => 'Recherchez des objets, armes et équipements';

  @override
  String get recipesFeatureTitle => 'Recettes';

  @override
  String get recipesFeatureSubtitle => 'Découvrez des recettes d\'artisanat';

  @override
  String get setsFeatureTitle => 'Ensembles';

  @override
  String get setsFeatureSubtitle => 'Composez les meilleurs ensembles';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsLanguageLabel => 'Langue';

  @override
  String get languageSystemDefault => 'Système par défaut';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languagePortuguese => 'Portugais';

  @override
  String get languageFrench => 'Français';

  @override
  String get itemSearchHint => 'Rechercher un objet, ex : Atcham';

  @override
  String get itemSearchInitialTitle => 'Trouvez vos objets';

  @override
  String get itemSearchInitialMessage => 'Saisissez le nom d\'un objet Dofus pour commencer la recherche.';

  @override
  String get itemSearchEmptyTitle => 'Aucun objet trouvé';

  @override
  String get itemSearchEmptyMessage => 'Essayez un autre terme de recherche.';

  @override
  String itemLevelLabel(int level) {
    return 'Niveau $level';
  }

  @override
  String get retryButtonLabel => 'Réessayer';

  @override
  String get errorNetworkMessage => 'Pas de connexion Internet.';

  @override
  String get errorGenericMessage => 'Une erreur est survenue. Veuillez réessayer.';

  @override
  String get comingSoonTitle => 'Bientôt disponible';

  @override
  String get recipesComingSoonMessage => 'La recherche de recettes d\'artisanat arrive bientôt.';

  @override
  String get setsComingSoonMessage => 'La recherche d\'ensembles d\'équipement arrive bientôt.';
}
