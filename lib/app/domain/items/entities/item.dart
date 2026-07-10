import 'package:dofus_buddy/app/domain/items/entities/item_images.dart';
import 'package:dofus_buddy/app/domain/items/entities/item_subtype.dart';
import 'package:dofus_buddy/app/domain/items/entities/translated_id.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Item extends Equatable {
  const Item({
    required this.ankamaId,
    required this.name,
    required this.type,
    required this.itemSubtype,
    required this.level,
    required this.imageUrls,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  final int ankamaId;
  final String name;
  final TranslatedId type;
  final ItemSubtype itemSubtype;
  final int level;
  final ItemImages imageUrls;

  @override
  List<Object?> get props => [ankamaId, name, type, itemSubtype, level, imageUrls];
}
