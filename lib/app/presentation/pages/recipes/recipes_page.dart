import 'package:dofus_buddy/app/design_system/components/general/db_empty_state.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.recipesFeatureTitle)),
      body: DBEmptyState(icon: Icons.menu_book_outlined, title: l10n.comingSoonTitle, message: l10n.recipesComingSoonMessage),
    );
  }
}
