import 'app_locale.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocaleRu extends AppLocale {
  AppLocaleRu([String locale = 'ru']) : super(locale);

  @override
  String get search => 'Поиск';

  @override
  String get liked => 'Понравилось';

  @override
  String get disliked => 'Не нравится';

  @override
  String get arbEnding => 'Чтобы не забыть про отсутствие запятой';
}
