import 'package:dofus_buddy/app/cubit/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeLocale(Locale locale) => emit(AppState(locale: locale));

  void useSystemLocale() => emit(const AppState());
}
