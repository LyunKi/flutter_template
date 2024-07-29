import 'package:flutter_template/business/constants.dart';
import 'package:flutter_template/l10n/i18n.dart';
import 'package:harmony/harmony.dart';

String? passwordValidator(String? value) {
  if (value == null || !passwordRegex.hasMatch(value)) {
    return i18n.invalidPassword;
  }
  return null;
}

String? phoneNumberValidator(PhoneNumber? value) {
  final isValid = value?.isValid() ?? false;
  if (!isValid) {
    return i18n.invalidPhoneNumber;
  }
  return null;
}

createStringSizeValidator(int length) {
  return (String? value) {
    if (value == null || value.length > length) {
      return i18n.invalidVerificationCode;
    }
    return null;
  };
}
