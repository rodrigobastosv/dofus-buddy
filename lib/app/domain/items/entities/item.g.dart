// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  ankamaId: (json['ankama_id'] as num).toInt(),
  name: json['name'] as String,
  type: TranslatedId.fromJson(json['type'] as Map<String, dynamic>),
  itemSubtype: ItemSubtype.fromJson(json['item_subtype'] as Map<String, dynamic>),
  level: (json['level'] as num).toInt(),
  imageUrls: ItemImages.fromJson(json['image_urls'] as Map<String, dynamic>),
);
