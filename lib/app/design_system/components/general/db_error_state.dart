import 'package:dofus_buddy/app/design_system/components/buttons/db_primary_button.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:flutter/material.dart';

class DBErrorState extends StatelessWidget {
  const DBErrorState({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(Icons.error_outline, size: 56, color: colorScheme.error),
            const DBGap.m(),
            Text(message, style: DBTextStyles.body(context), textAlign: .center),
            if (onRetry != null) ...[
              const DBGap.l(),
              DBPrimaryButton(label: 'Tentar novamente', icon: Icons.refresh, isExpanded: false, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
