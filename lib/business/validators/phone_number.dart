import 'package:flutter_template/l10n/i18n.dart';

String? phoneNumberValidator(value) {
  final isValid = value?.isValid() ?? false;
  if (!isValid) {
    return i18n.invalidPhoneNumber;
  }
}
