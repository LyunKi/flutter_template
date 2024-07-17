import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cas => 'Central Authentication Service';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get reset => 'Reset';

  @override
  String get welcome => 'Begin Your Journey';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get invalidPhoneNumber => 'Unrecognized phone number';

  @override
  String get invalidPassword => 'Password length cannot exceed 30 characters and cannot contain spaces';

  @override
  String get password => 'Password';

  @override
  String get verificationCode => 'Verification Code';

  @override
  String get repeatPassword => 'Repeat Password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get orLogin => 'or Continue with';

  @override
  String get noAccount => 'Don\'t have an account yet? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get hasAccount => 'Already have an account? ';

  @override
  String get loginNow => 'Login Now';

  @override
  String get clickToConfirm => 'By clicking button above, you agree to our ';

  @override
  String get terms => 'Terms';

  @override
  String get and => ' and ';

  @override
  String get privacy => 'Privacy';

  @override
  String get companyName => 'Cloud Dragon';
}
