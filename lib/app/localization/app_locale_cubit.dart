import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

class AppLocaleCubit extends Cubit<Locale> {
  AppLocaleCubit() : super(const Locale('es')) {
    Intl.defaultLocale = 'es';
  }

  void setLocale(Locale locale) {
    Intl.defaultLocale = locale.languageCode;
    emit(locale);
  }

  void toggle() {
    if (state.languageCode == 'es') {
      setLocale(const Locale('en'));
      return;
    }

    setLocale(const Locale('es'));
  }
}
