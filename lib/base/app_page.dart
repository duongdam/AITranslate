import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:AITranslate/base/app_cubit.dart';
import 'package:AITranslate/common/app_theme.dart';
import 'package:AITranslate/configs/routers/go_router.dart';
import 'package:AITranslate/configs/routers/go_router_ultils.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: '_rootNavigatorKey');
final tabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'TAB1');
late GoRouter appRouter;

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late GoRouterRefreshStream refreshStream;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();

    /// For AppRouter Init
    refreshStream = GoRouterRefreshStream.instance;
    appRouter = AppRouter(refreshStream).goRouter;
    if (kIsWeb) {
      GoRouter.optionURLReflectsImperativeAPIs = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      isDarkMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Change theme mode
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final brightness = MediaQuery.of(context).platformBrightness;
      if (brightness == Brightness.dark) {
        setState(() {
          isDarkMode = true;
        });
      }
      if (isDarkMode && brightness == Brightness.light) {
        setState(() {
          isDarkMode = false;
        });
      }
    });

    final appTheme = AppTheme.initialize(isDarkMode);

    /// Todo: If needed, then implement MultiRepositoryProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (BuildContext context) => AppCubit()..init(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              title: 'AI Translate',
              routerConfig: appRouter,
              builder: (BuildContext context, Widget? child) {
                var mediaQueryData = MediaQuery.of(context);
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  primary: true,
                  child: SizedBox(
                      height: mediaQueryData.size.height,
                      width: mediaQueryData.size.width,
                      child: MediaQuery(
                        data: mediaQueryData.copyWith(
                          textScaler: mediaQueryData.textScaler.clamp(minScaleFactor: 1.0, maxScaleFactor: 1.3),
                        ),
                        child: child!,
                      )),
                );
              });
        },
      ),
    );
  }
}
