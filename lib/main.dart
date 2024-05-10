import 'dart:async';

import 'package:AITranslate/base/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'common/app_configs.dart';

void main() async {
  usePathUrlStrategy();
  await dotenv.load(fileName: ".env");
  debugPrint('F_ENV: ${AppConfigs.env}');
  Widget app = await initializeApp();
  runApp(app);
}

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// First init firebase
  // await initFirebase();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white.withOpacity(0),
    // set Status bar color in Android devices
    statusBarIconBrightness: Brightness.light,
    // set Status bar icons color in Android devices
    statusBarBrightness: Brightness.light, // set Status bar icon color in iOS
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runZonedGuarded(() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }, (onError, stack) {
    debugPrint(onError.toString());
  });

  return Container(
    color: Colors.white,
    child: const Center(child: AppPage()),
  );
}
