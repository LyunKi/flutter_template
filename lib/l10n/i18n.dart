import 'dart:ui';

import 'package:flutter_template/l10n/app_localizations.dart';

late AppLocalizations i18n;

void initAppI18n(Locale locale) {
  i18n = lookupAppLocalizations(locale);
}
