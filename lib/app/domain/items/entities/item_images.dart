import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_images.g.dart';

@JsonSerializable(createToJson: false)
class ItemImages extends Equatable {
  const ItemImages({required this.icon, this.sd, this.hq, this.hd});

  factory ItemImages.fromJson(Map<String, dynamic> json) => _$ItemImagesFromJson(json);

  final String icon;
  final String? sd;
  final String? hq;
  final String? hd;

  @override
  List<Object?> get props => [icon, sd, hq, hd];
}
