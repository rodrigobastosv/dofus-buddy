import 'package:dofus_buddy/app/design_system/components/cards/db_card.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/components/images/db_network_image.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

class ItemSearchTile extends StatelessWidget {
  const ItemSearchTile({required this.item, super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return DBCard(
      child: Row(
        children: [
          DBNetworkImage(url: item.imageUrls.icon),
          const DBGap.m(),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(item.name, style: DBTextStyles.bodyStrong(context)),
                Text(
                  '${item.type.name} · ${l10n.itemLevelLabel(item.level)}',
                  style: DBTextStyles.caption(context).copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
