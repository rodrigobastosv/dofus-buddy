import 'package:equatable/equatable.dart';

sealed class Result<F, S> extends Equatable {
  const Result();

  bool get isSuccess => this is Success<F, S>;

  bool get isFailed => this is Failed<F, S>;

  T fold<T>(T Function(F failure) onError, T Function(S success) onSuccess) => switch (this) {
    Success<F, S>(value: final value) => onSuccess(value),
    Failed<F, S>(failure: final failure) => onError(failure),
  };
}

final class Success<F, S> extends Result<F, S> {
  const Success(this.value);

  final S value;

  @override
  List<Object?> get props => [value];
}

final class Failed<F, S> extends Result<F, S> {
  const Failed(this.failure);

  final F failure;

  @override
  List<Object?> get props => [failure];
}
