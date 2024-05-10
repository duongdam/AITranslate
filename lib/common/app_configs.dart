import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigs {
  static var env = dotenv.env['F_ENV'] ?? 'dev';
  static get isProd => env == 'prod' ? true : false;
  static var privacyPolicyUrl = dotenv.env['F_PRIVACY_POLICY_URL'] ?? 'https://classfunc.com/privacy-policy';
  /// Todo: Add more configurations here if needed
}