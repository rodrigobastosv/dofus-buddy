import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppState extends Equatable {
  const AppState({this.locale});

  final Locale? locale;

  @override
  List<Object?> get props => [locale];
}
