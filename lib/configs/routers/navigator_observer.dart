import 'package:flutter/material.dart';

class AINavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('PUSH TO $route FROM $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('POP TO $route FROM $previousRoute');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    debugPrint('REMOVE $route FROM $previousRoute');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('REPLACE ROUTER $newRoute BY $oldRoute');
  }

  @override
  void didStartUserGesture(
          Route<dynamic> route, Route<dynamic>? previousRoute) =>
      debugPrint('didStartUserGesture: $route, previousRoute= $previousRoute');

  @override
  void didStopUserGesture() => debugPrint('didStopUserGesture');
}
