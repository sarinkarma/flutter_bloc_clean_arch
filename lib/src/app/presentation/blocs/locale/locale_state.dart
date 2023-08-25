
part of 'locale_cubit.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({
    @Default(Locale('en')) Locale locale,
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _LocaleState;
}
