import 'package:dofus_buddy/app/core/env/env.dart';
import 'package:dofus_buddy/app/core/http/db_base_http_request.dart';

abstract class DBHttpRequest implements DBBaseHttpRequest {
  String get endpoint;

  @override
  String get path => '${Env.game}/v1/${Env.defaultLanguage}/$endpoint';

  @override
  Map<String, dynamic>? get body => null;

  @override
  Map<String, dynamic> get queryParameters => {};

  @override
  Map<String, dynamic> get headers => {};
}
