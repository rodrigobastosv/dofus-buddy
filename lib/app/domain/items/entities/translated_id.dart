import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'translated_id.g.dart';

@JsonSerializable(createToJson: false)
class TranslatedId extends Equatable {
  const TranslatedId({required this.id, required this.name});

  factory TranslatedId.fromJson(Map<String, dynamic> json) => _$TranslatedIdFromJson(json);

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
