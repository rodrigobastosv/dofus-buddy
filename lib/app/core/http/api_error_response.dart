class ApiErrorResponse {
  const ApiErrorResponse({required this.status, required this.error, required this.code, required this.message});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => ApiErrorResponse(
    status: json['status'] as int? ?? 0,
    error: json['error'] as String? ?? '',
    code: json['code'] as String? ?? '',
    message: json['message'] as String? ?? '',
  );

  final int status;
  final String error;
  final String code;
  final String message;
}
