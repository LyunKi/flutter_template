import 'package:flutter_template/business/constants.dart';
import 'package:flutter_template/l10n/i18n.dart';

String? passwordValidator(value) {
  if (value == null || !passwordRegex.hasMatch(value)) {
    return i18n.invalidPassword;
  }
  return null;
}
