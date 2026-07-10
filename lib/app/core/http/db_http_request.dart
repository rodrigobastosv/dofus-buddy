import 'package:dofus_buddy/app/core/http/db_base_http_request.dart';

abstract class DBHttpRequest implements DBBaseHttpRequest {
  @override
  Map<String, dynamic>? get body => null;

  @override
  Map<String, dynamic> get queryParameters => {};

  @override
  Map<String, dynamic> get headers => {};
}
