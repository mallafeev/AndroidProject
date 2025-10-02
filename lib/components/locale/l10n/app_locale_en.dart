import 'app_locale.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocaleEn extends AppLocale {
  AppLocaleEn([String locale = 'en']) : super(locale);

  @override
  String get search => 'Search';

  @override
  String get liked => 'Liked';

  @override
  String get disliked => 'Disliked';

  @override
  String get arbEnding => 'Чтобы не забыть про отсутствие запятой';
}
