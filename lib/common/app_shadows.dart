import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static final giftShadow = BoxShadow(
    color: AppColors.c8e7bcc.withOpacity(.3),
    blurRadius: 10,
    spreadRadius: 0,
    offset: const Offset(-4, 4),
  );

  static final chatGptShadow = BoxShadow(
    color: AppColors.pureBlack.withOpacity(.25),
    blurRadius: 4,
    spreadRadius: 0,
    offset: const Offset(0, 0),
  );

  static const termShadow = BoxShadow(
    blurRadius: 4.0,
    spreadRadius: 0,
    color: Color(0x25090F13),
    offset: Offset(0.0, 2.0),
  );

  static const dialogShadow = BoxShadow(
    blurRadius: 12.0,
    spreadRadius: 0,
    color: Color(0x33000000),
    offset: Offset(0.0, 5.0),
  );

  static const chapterToolItemShadow = BoxShadow(
    blurRadius: 3.0,
    color: Color(0x33000000),
    offset: Offset(0.0, 1.0),
  );

  static const chapterTotalItemToolShadow = BoxShadow(
    blurRadius: 3.0,
    color: Color(0x33000000),
    offset: Offset(0.0, 1.0),
  );

  static final dialogDisconnectNetworkShadow = BoxShadow(
    offset: const Offset(.0, 5.0),
    blurRadius: 25,
    spreadRadius: 0,
    color: const Color(0xFF59618B).withOpacity(0.17),
  );

  static final notFoundArticleShadow = BoxShadow(
    offset: const Offset(0, 13),
    blurRadius: 25,
    color: const Color(0xFF56B3C2).withOpacity(0.17),
  );

  static final notFoundPageShadow = BoxShadow(
    offset: const Offset(0, 5),
    blurRadius: 25,
    color: Colors.black.withOpacity(0.17),
  );
}
