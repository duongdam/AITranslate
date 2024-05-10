import 'package:flutter/material.dart';


enum RouterPage {
  /// Init all of router page for projects

  root("/", "/","/"),
  /// Home router
  home("home", "home", "/home"),
  /// Extra pages router
  notFoundPage("not-found-page", "not-found-page", "/not-found-page");

  final String routerName;
  final String routerPath;
  final String navPath;

  const RouterPage(
    this.routerName,
    this.routerPath,
    this.navPath,
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream._();

  static GoRouterRefreshStream? _instance;

  static GoRouterRefreshStream get instance =>
      _instance ??= GoRouterRefreshStream._();

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnTokenChange = true; // Init value

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnTokenChange = notify;

  void refreshRouter() {
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnTokenChange) {
      notifyListeners();
    }
  }
}
