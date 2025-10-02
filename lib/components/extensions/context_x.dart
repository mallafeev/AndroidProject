import 'package:flutter/cupertino.dart';
import 'package:pmu_malafeev_pi31/components/locale/l10n/app_locale.dart';

extension LocalContextX on BuildContext{
  AppLocale get locale => AppLocale.of(this)!;
}