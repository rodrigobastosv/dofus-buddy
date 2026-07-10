import 'package:dofus_buddy/app/core/http/enums/http_method.dart';

abstract interface class DBBaseHttpRequest {
  String get path;
  HttpMethod get method;
  Map<String, dynamic>? get body;
  Map<String, dynamic> get queryParameters;
  Map<String, dynamic> get headers;
}
