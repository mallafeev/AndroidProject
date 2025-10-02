import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/locale/l10n/app_locale.dart';
import 'locale_events.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(Locale defaultLocale) : super(LocaleState(currentLocale: defaultLocale)) {
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  Future<void> _onChangeLocale(ChangeLocaleEvent event, Emitter<LocaleState> emit) async {
    final toChange = AppLocale.supportedLocales
        .firstWhere((e) => e.languageCode != state.currentLocale.languageCode);
    emit(state.copyWith(currentLocale: toChange));
  }
}