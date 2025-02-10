import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/core/app_cubit/app_cubit.dart';
import 'package:flutter_basics/core/di/injector.dart';
import 'package:flutter_basics/core/ext/ext_string.dart';
import 'package:flutter_basics/core/logger/logger_config.dart';
import 'package:flutter_basics/core/routes/app_routes.dart';
import 'package:flutter_basics/src/column/page/column_page.dart';
import 'package:flutter_basics/src/container/page/container_page.dart';
import 'package:flutter_basics/src/error/error_page.dart';
import 'package:flutter_basics/src/home/page/home_page.dart';
import 'package:flutter_basics/src/home/page/test_page.dart';
import 'package:flutter_basics/src/main/side_bar_widget.dart';
import 'package:flutter_basics/src/row/page/row_page.dart';
import 'package:flutter_basics/src/text/page/text_page.dart';
import 'package:flutter_basics/src/wrap/page/wrap_page.dart';
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
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) => SideBarWidget(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.homePage,
          name: AppRoutes.homePage,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.textPage.path,
          name: AppRoutes.textPage,
          builder: (context, state) => const TextPage(),
        ),
        GoRoute(
          path: AppRoutes.rowPage.path,
          name: AppRoutes.rowPage,
          builder: (context, state) => const RowPage(),
        ),
        GoRoute(
          path: AppRoutes.columnPage.path,
          name: AppRoutes.columnPage,
          builder: (context, state) => const ColumnPage(),
        ),
        GoRoute(
          path: AppRoutes.wrapPage.path,
          name: AppRoutes.wrapPage,
          builder: (context, state) => const WrapPage(),
        ),
        GoRoute(
          path: AppRoutes.containerPage.path,
          name: AppRoutes.containerPage,
          builder: (context, state) => const ContainerPage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.testPage.path,
      name: AppRoutes.testPage,
      builder: (context, state) => const TestPage(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
