import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/data/items/items_repository.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';

class SearchItemsUseCase {
  SearchItemsUseCase({required ItemsRepository itemsRepository}) : _itemsRepository = itemsRepository;

  final ItemsRepository _itemsRepository;

  Future<Result<DBError, List<Item>>> call({required String query, int limit = 20}) =>
      _itemsRepository.searchItems(query: query, limit: limit);
}
