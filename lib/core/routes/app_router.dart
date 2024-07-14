import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/core/app_cubit/app_cubit.dart';
import 'package:flutter_basics/core/di/injector.dart';
import 'package:flutter_basics/core/ext/ext_string.dart';
import 'package:flutter_basics/core/logger/logger_config.dart';
import 'package:flutter_basics/core/routes/app_routes.dart';
import 'package:flutter_basics/src/column/page/column_page.dart';
import 'package:flutter_basics/src/error/error_page.dart';
import 'package:flutter_basics/src/home/page/home_page.dart';
import 'package:flutter_basics/src/home/page/test_page.dart';
import 'package:flutter_basics/src/row/page/row_page.dart';
import 'package:flutter_basics/src/text/page/text_page.dart';
import 'package:flutter_basics/src/widgets/side_bar_widget.dart';
import 'package:go_router/go_router.dart';

/// [rootNavKey] for navigation tracking
final rootNavKey = GlobalKey<NavigatorState>();

/// [appRouter] is responsible for all navigation stuff
final appRouter = GoRouter(
  navigatorKey: rootNavKey,
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final currentPath = state.matchedLocation;
    'Current Path : $currentPath'.logD;
    Injector.instance<AppCubit>().findCurrentPathAndSetSideBar(currentPath);

    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => SideBarWidget(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.instance.homePage,
          name: AppRoutes.instance.homePage,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.instance.textPage.path,
          name: AppRoutes.instance.textPage,
          builder: (context, state) => const TextPage(),
        ),
        GoRoute(
          path: AppRoutes.instance.rowPage.path,
          name: AppRoutes.instance.rowPage,
          builder: (context, state) => const RowPage(),
        ),
        GoRoute(
          path: AppRoutes.instance.columnPage.path,
          name: AppRoutes.instance.columnPage,
          builder: (context, state) => const ColumnPage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.instance.testPage.path,
      name: AppRoutes.instance.testPage,
      builder: (context, state) => const TestPage(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
