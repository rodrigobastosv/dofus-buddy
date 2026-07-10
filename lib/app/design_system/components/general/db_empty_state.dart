import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:flutter/material.dart';

class DBEmptyState extends StatelessWidget {
  const DBEmptyState({required this.message, this.icon = Icons.search_off, this.title, super.key});

  final String message;
  final String? title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(icon, size: 56, color: colorScheme.onSurfaceVariant),
            const DBGap.m(),
            if (title != null) ...[Text(title!, style: DBTextStyles.title(context), textAlign: .center), const DBGap.s()],
            Text(
              message,
              style: DBTextStyles.body(context).copyWith(color: colorScheme.onSurfaceVariant),
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
