import 'package:dio/dio.dart';
import 'package:dofus_buddy/app/core/env/env.dart';

abstract class DioFactory {
  static Dio create() => Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
