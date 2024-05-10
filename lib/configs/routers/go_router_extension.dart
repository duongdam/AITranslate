import 'package:flutter/cupertino.dart';
import 'package:AITranslate/configs/routers/go_router_ultils.dart';
import 'package:go_router/go_router.dart';

extension MainRouterExtension on BuildContext {
  String get locale => Localizations.localeOf(this).languageCode;
  String get location => GoRouterState.of(this).uri.toString();
  /// IF PopBackWithType.refresh, refresh the page when mounted to HomePage
  void toHome(String refresh) =>
      GoRouter.of(this).go(RouterPage.home.navPath, extra: {
        'popBackType': refresh,
      });

  Future<dynamic> pushDialog({
    required String routerPath,
    Map<String, dynamic>? extraParam,
  }) =>
      GoRouter.of(this).push(routerPath, extra: extraParam);
}

extension GoRouterExtension on GoRouter {
  String get locationWithOutContext {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }

  void toHome() => go(RouterPage.home.navPath);
}

extension GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};

  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
}
