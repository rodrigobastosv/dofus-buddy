import 'package:dofus_buddy/app/core/navigation/navigation_extensions.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/components/tiles/db_feature_tile.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined), tooltip: l10n.settingsTitle, onPressed: () => context.pushRoute(.settings)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: DBSpacing.m, vertical: DBSpacing.s),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(Icons.auto_awesome, size: 32, color: colorScheme.onPrimaryContainer),
            ),
            const DBGap.m(),
            Text(l10n.appTitle, style: DBTextStyles.display(context)),
            const DBGap.xs(),
            Text(l10n.homeTagline, style: DBTextStyles.body(context).copyWith(color: colorScheme.onSurfaceVariant)),
            const DBGap.xl(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: DBSpacing.m,
              crossAxisSpacing: DBSpacing.m,
              childAspectRatio: 1.1,
              children: [
                DBFeatureTile(
                  icon: Icons.inventory_2_outlined,
                  title: l10n.itemsFeatureTitle,
                  subtitle: l10n.itemsFeatureSubtitle,
                  onTap: () => context.pushRoute(.items),
                ),
                DBFeatureTile(
                  icon: Icons.menu_book_outlined,
                  title: l10n.recipesFeatureTitle,
                  subtitle: l10n.recipesFeatureSubtitle,
                  onTap: () => context.pushRoute(.recipes),
                ),
                DBFeatureTile(
                  icon: Icons.diamond_outlined,
                  title: l10n.setsFeatureTitle,
                  subtitle: l10n.setsFeatureSubtitle,
                  onTap: () => context.pushRoute(.sets),
                ),
              ],
            ),
            const DBGap.xl(),
            Center(
              child: Text(l10n.homeAttribution, textAlign: .center, style: DBTextStyles.caption(context)),
            ),
            const DBGap.m(),
          ],
        ),
      ),
    );
  }
}
