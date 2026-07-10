import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';
import 'package:equatable/equatable.dart';

enum ItemSearchStatus { initial, loading, success, failure }

class ItemSearchState extends Equatable {
  const ItemSearchState({this.status = .initial, this.items = const [], this.failure});

  final ItemSearchStatus status;
  final List<Item> items;
  final DBError? failure;

  ItemSearchState copyWith({ItemSearchStatus? status, List<Item>? items, DBError? failure}) =>
      ItemSearchState(status: status ?? this.status, items: items ?? this.items, failure: failure ?? this.failure);

  @override
  List<Object?> get props => [status, items, failure];
}
