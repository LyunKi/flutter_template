import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get cas => '认证服务中心';

  @override
  String get login => '登录';

  @override
  String get register => '注册';

  @override
  String get reset => '重置密码';

  @override
  String get welcome => '开始您的旅程';

  @override
  String get phoneNumber => '手机号';

  @override
  String get invalidPhoneNumber => '无法识别的手机号';

  @override
  String get invalidPassword => '密码长度不能超过30位字符，且不能包含空格';

  @override
  String get invalidVerificationCode => '验证码长度应为6位字符';

  @override
  String get password => '密码';

  @override
  String get verificationCode => '验证码';

  @override
  String get repeatPassword => '重复密码';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get orLogin => '第三方登录';

  @override
  String get noAccount => '没有账号？';

  @override
  String get signUp => '立即注册';

  @override
  String get hasAccount => '已有账号？';

  @override
  String get loginNow => '立即登录';

  @override
  String get clickToConfirm => '点击以上按钮，说明您同意我们的';

  @override
  String get terms => ' 条款 ';

  @override
  String get and => '和';

  @override
  String get privacy => ' 隐私政策 ';

  @override
  String get companyName => '云龙科技';
}
