import 'package:dofus_buddy/app/core/http/db_http_request.dart';
import 'package:dofus_buddy/app/core/http/enums/http_method.dart';

class SearchItemsRequest extends DBHttpRequest {
  SearchItemsRequest({required this.query, required this.limit});

  final String query;
  final int limit;

  @override
  String get endpoint => 'items/search';

  @override
  HttpMethod get method => .get;

  @override
  Map<String, dynamic> get queryParameters => {'query': query, 'limit': limit};
}
