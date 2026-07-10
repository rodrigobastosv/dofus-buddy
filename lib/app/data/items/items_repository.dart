import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/data/items/datasources/items_remote_datasource.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';

class ItemsRepository {
  ItemsRepository(this._remoteDatasource);

  final ItemsRemoteDatasource _remoteDatasource;

  Future<Result<DBError, List<Item>>> searchItems({required String query, int limit = 20}) =>
      _remoteDatasource.searchItems(query: query, limit: limit);
}
