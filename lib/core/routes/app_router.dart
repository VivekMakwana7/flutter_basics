import 'package:flutter/cupertino.dart';import 'package:flutter_basics/core/ext/ext_string.dart';import 'package:flutter_basics/core/routes/app_routes.dart';import 'package:flutter_basics/src/error/error_page.dart';import 'package:flutter_basics/src/home/page/home_page.dart';import 'package:flutter_basics/src/home/page/test_page.dart';import 'package:flutter_basics/src/row/page/row_page.dart';import 'package:flutter_basics/src/text/page/text_page.dart';import 'package:flutter_basics/src/widgets/side_bar_widget.dart';import 'package:go_router/go_router.dart';/// [rootNavKey] for navigation trackingfinal rootNavKey = GlobalKey<NavigatorState>();/// [appRouter] is responsible for all navigation stufffinal appRouter = GoRouter(  navigatorKey: rootNavKey,  debugLogDiagnostics: true,  routes: [    ShellRoute(      builder: (context, state, child) => SideBarWidget(child: child),      routes: [        GoRoute(          path: AppRoutes.homePage,          name: AppRoutes.homePage,          builder: (context, state) => const HomePage(),        ),        GoRoute(          path: AppRoutes.textPage.path,          name: AppRoutes.textPage,          builder: (context, state) => const TextPage(),        ),        GoRoute(          path: AppRoutes.rowPage.path,          name: AppRoutes.rowPage,          builder: (context, state) => const RowPage(),        ),      ],    ),    GoRoute(      path: AppRoutes.testPage.path,      name: AppRoutes.testPage,      builder: (context, state) => const TestPage(),    ),  ],  errorBuilder: (context, state) => const ErrorPage(),);