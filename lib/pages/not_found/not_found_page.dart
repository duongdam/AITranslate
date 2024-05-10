import 'package:flutter/material.dart';
import 'package:AITranslate/common/app_image.dart';
import 'package:AITranslate/common/app_screens.dart';
import 'package:AITranslate/common/app_shadows.dart';
import 'package:AITranslate/configs/routers/go_router_ultils.dart';
import 'package:AITranslate/extensions/widget_extensions.dart';
import 'package:url_launcher/link.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  static final buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bottomDiff = AppScreenSize.of(context).height * .14;
    final leftDiff = AppScreenSize.of(context).width * .065;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.icNotFoundPage,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [AppShadows.notFoundPageShadow],
            ),
            child: Link(
              uri: Uri.parse(RouterPage.home.navPath),
              builder: (context, followLink) {
                return TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    followLink!.call();
                  },
                  child: Text('Trở về Home'.toUpperCase()),
                );
              },
            ),
          ).position(bottom: bottomDiff, left: leftDiff),
        ],
      ),
    );
  }
}
