// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Dofus Buddy';

  @override
  String get homeTagline => 'Um companheiro não-oficial para jogadores de Dofus.';

  @override
  String get homeAttribution => 'Dados fornecidos pela API pública dofusdu.de. Este app não possui nenhuma afiliação oficial com a Ankama.';

  @override
  String get itemsFeatureTitle => 'Itens';

  @override
  String get itemsFeatureSubtitle => 'Busque itens, armas e equipamentos';

  @override
  String get recipesFeatureTitle => 'Receitas';

  @override
  String get recipesFeatureSubtitle => 'Descubra receitas de artesanato';

  @override
  String get setsFeatureTitle => 'Conjuntos';

  @override
  String get setsFeatureSubtitle => 'Monte os melhores conjuntos';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsLanguageLabel => 'Idioma';

  @override
  String get languageSystemDefault => 'Padrão do sistema';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageFrench => 'Francês';

  @override
  String get itemSearchHint => 'Buscar item, ex: Atcham';

  @override
  String get itemSearchInitialTitle => 'Encontre seus itens';

  @override
  String get itemSearchInitialMessage => 'Digite o nome de um item do Dofus para começar a busca.';

  @override
  String get itemSearchEmptyTitle => 'Nenhum item encontrado';

  @override
  String get itemSearchEmptyMessage => 'Tente buscar com outro termo.';

  @override
  String itemLevelLabel(int level) {
    return 'Nível $level';
  }

  @override
  String get retryButtonLabel => 'Tentar novamente';

  @override
  String get errorNetworkMessage => 'Sem conexão com a internet.';

  @override
  String get errorGenericMessage => 'Algo deu errado. Tente novamente.';

  @override
  String get comingSoonTitle => 'Em breve';

  @override
  String get recipesComingSoonMessage => 'A busca de receitas de artesanato ainda está a caminho.';

  @override
  String get setsComingSoonMessage => 'A busca de conjuntos de equipamentos ainda está a caminho.';
}
