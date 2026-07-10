import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/core/http/db_http_client.dart';
import 'package:dofus_buddy/app/data/items/datasources/requests/search_items_request.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';

class ItemsRemoteDatasource {
  ItemsRemoteDatasource(this._httpClient);

  final DBHttpClient _httpClient;

  Future<Result<DBError, List<Item>>> searchItems({required String query, required int limit}) async {
    final responseResult = await _httpClient.request(SearchItemsRequest(query: query, limit: limit));
    return responseResult.when(Error.new, (response) {
      final data = response['data'] as List<dynamic>;
      final items = data.cast<Map<String, dynamic>>().map(Item.fromJson).toList();
      return Success(items);
    });
  }
}
