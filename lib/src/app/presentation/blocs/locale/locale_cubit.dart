
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'locale_cubit.freezed.dart';
part 'locale_state.dart';

@injectable
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState());

  void changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void changeThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }
}
