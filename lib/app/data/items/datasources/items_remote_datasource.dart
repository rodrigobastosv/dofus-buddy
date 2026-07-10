import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/core/http/db_http_client.dart';
import 'package:dofus_buddy/app/data/items/datasources/requests/search_items_request.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';

class ItemsRemoteDatasource {
  ItemsRemoteDatasource(this._httpClient);

  final DBHttpClient _httpClient;

  Future<Result<DBError, List<Item>>> searchItems({required String query, required int limit}) async {
    final searchResponse = await _httpClient.request(SearchItemsRequest(query: query, limit: limit));

    return switch (searchResponse) {
      Success(value: final rawItems) => Success((rawItems as List<dynamic>).cast<Map<String, dynamic>>().map(Item.fromJson).toList()),
      Failed(failure: final failure) => Failed(failure),
    };
  }
}
