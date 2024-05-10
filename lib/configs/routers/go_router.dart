import 'package:AITranslate/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:AITranslate/base/app_page.dart';
import 'package:AITranslate/configs/routers/go_page_transition.dart';
import 'package:AITranslate/configs/routers/go_router_extension.dart';
import 'package:AITranslate/configs/routers/go_router_ultils.dart';
import 'package:AITranslate/configs/routers/navigator_observer.dart';
import 'package:AITranslate/pages/not_found/not_found_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouterRefreshStream _refresh;

  AppRouter(this._refresh);

  GoRouter get goRouter => _goRouter;

  GoRouter get _goRouter => GoRouter(
        initialLocation: RouterPage.root.navPath,
        navigatorKey: rootNavigatorKey,
        refreshListenable: _refresh,
        debugLogDiagnostics: true,
        errorBuilder: (context, state) {
          return const NotFoundPage();
        },
        redirect: (context, state) {
          final String routeName = state.matchedLocation;
          debugPrint('routeName: $routeName');
          switch (routeName) {
            case '/home':
              break;
            default:
              break;
          }

          if (state.matchedLocation == RouterPage.notFoundPage.navPath) {
            return RouterPage.home.navPath;
          }
          return null;
        },
        redirectLimit: 10,
        observers: [AINavigatorObserver()],
        routes: <GoRoute>[
          GoRoute(
            name: RouterPage.root.routerName,
            path: RouterPage.root.routerName,
            builder: (context, state) => const HomePageView(popBackType: null),
            routes: <RouteBase>[
              _homeRouter,
            ],
            //   ShellRoute(
            //       navigatorKey: tabNavigatorKey,
            //       builder: (context, state, child) {
            //         return BottomNavigationController(
            //           child: child,
            //         );
            //       },
            //       routes: [
            //         _homeRouter
            //       ]),
            // ],
          ),
        ],
      );
}

GoRoute _homeRouter = GoRoute(
  name: RouterPage.home.routerName,
  path: RouterPage.home.routerPath,
  pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: HomePageView(popBackType: state.extraMap['popBackType'] ?? 'normal'),
      transition: AIPageTransition.topToBottom(child: const HomePageView(popBackType: null,))),
);
