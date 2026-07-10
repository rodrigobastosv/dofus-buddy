import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_radius.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:flutter/material.dart';

class DBFeatureTile extends StatelessWidget {
  const DBFeatureTile({required this.icon, required this.title, required this.subtitle, required this.onTap, super.key});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surfaceContainerHighest,
      borderRadius: DBRadius.borderRadiusL,
      child: InkWell(
        onTap: onTap,
        borderRadius: DBRadius.borderRadiusL,
        child: Padding(
          padding: const EdgeInsets.all(DBSpacing.m),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: const EdgeInsets.all(DBSpacing.s),
                decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: DBRadius.borderRadiusM),
                child: Icon(icon, color: colorScheme.onPrimaryContainer),
              ),
              const DBGap.m(),
              Text(title, style: DBTextStyles.title(context)),
              const DBGap.xs(),
              Text(
                subtitle,
                style: DBTextStyles.caption(context).copyWith(color: colorScheme.onSurfaceVariant),
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
