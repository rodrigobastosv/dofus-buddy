import 'package:dofus_buddy/app/domain/items/entities/item.dart';
import 'package:dofus_buddy/app/domain/items/entities/item_images.dart';
import 'package:dofus_buddy/app/domain/items/entities/item_subtype.dart';
import 'package:dofus_buddy/app/domain/items/entities/translated_id.dart';

abstract class ItemFactory {
  static Item create({int? ankamaId, String? name, TranslatedId? type, ItemSubtype? itemSubtype, int? level, ItemImages? imageUrls}) =>
      Item(
        ankamaId: ankamaId ?? 1,
        name: name ?? 'Atcham',
        type: type ?? const TranslatedId(id: 1, name: 'Amulet'),
        itemSubtype: itemSubtype ?? const ItemSubtype(ankamaId: 1, nameId: 'amulet'),
        level: level ?? 190,
        imageUrls: imageUrls ?? const ItemImages(icon: 'https://example.com/icon.png'),
      );
}
