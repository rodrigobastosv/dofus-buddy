import 'package:equatable/equatable.dart';

sealed class DBError extends Equatable {
  const DBError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ApiError extends DBError {
  const ApiError({required this.statusCode, required String message}) : super(message);

  final int statusCode;

  @override
  List<Object?> get props => [statusCode, message];
}

final class NetworkError extends DBError {
  const NetworkError() : super('No internet connection');
}

final class UnknownError extends DBError {
  const UnknownError([super.message = 'Something went wrong']);
}
