import 'package:dofus_buddy/app/design_system/components/general/db_empty_state.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

class SetsPage extends StatelessWidget {
  const SetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.setsFeatureTitle)),
      body: DBEmptyState(icon: Icons.diamond_outlined, title: l10n.comingSoonTitle, message: l10n.setsComingSoonMessage),
    );
  }
}
