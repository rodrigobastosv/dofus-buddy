import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_subtype.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ItemSubtype extends Equatable {
  const ItemSubtype({required this.ankamaId, required this.nameId});

  factory ItemSubtype.fromJson(Map<String, dynamic> json) => _$ItemSubtypeFromJson(json);

  final int ankamaId;
  final String nameId;

  @override
  List<Object?> get props => [ankamaId, nameId];
}
