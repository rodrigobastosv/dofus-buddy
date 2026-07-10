import 'package:dio/dio.dart';
import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/core/http/api_error_response.dart';
import 'package:dofus_buddy/app/core/http/db_base_http_request.dart';
import 'package:dofus_buddy/app/core/logging/app_logger.dart';

class DBHttpClient {
  DBHttpClient(this._dio) : _logger = AppLogger('DBHttpClient');

  final Dio _dio;
  final AppLogger _logger;

  Future<Result<DBError, dynamic>> request(DBBaseHttpRequest request) async {
    try {
      final response = await _dio.request<dynamic>(
        request.path,
        data: request.body,
        queryParameters: request.queryParameters,
        options: Options(method: request.method.methodName, headers: request.headers),
      );
      return Success(response.data);
    } on DioException catch (error, stackTrace) {
      _logger.error('${request.method.methodName} ${request.path} failed', error, stackTrace);
      return Failed(_mapDioException(error));
    } catch (error, stackTrace) {
      _logger.error('${request.method.methodName} ${request.path} failed unexpectedly', error, stackTrace);
      return const Failed(UnknownError());
    }
  }

  DBError _mapDioException(DioException exception) {
    final isConnectivityIssue = exception.type == .connectionError || exception.type == .connectionTimeout;
    if (isConnectivityIssue) {
      return const NetworkError();
    }

    final statusCode = exception.response?.statusCode;
    final data = exception.response?.data;
    if (statusCode != null && data is Map<String, dynamic>) {
      final apiErrorResponse = ApiErrorResponse.fromJson(data);
      return ApiError(statusCode: statusCode, message: apiErrorResponse.message.isNotEmpty ? apiErrorResponse.message : 'Request failed');
    }

    return const UnknownError();
  }
}
