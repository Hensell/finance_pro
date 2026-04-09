import 'dart:ui';

import 'package:bloc/bloc.dart';

class AppLocaleCubit extends Cubit<Locale> {
  AppLocaleCubit() : super(const Locale('es'));

  void setLocale(Locale locale) {
    emit(locale);
  }

  void toggle() {
    if (state.languageCode == 'es') {
      emit(const Locale('en'));
      return;
    }

    emit(const Locale('es'));
  }
}
