// Ignore
// ignore_for_file: public_member_api_docs

import 'package:flutter_basics/core/ext/ext_string.dart';

/// [AppRoutes] contains all navigation constant file page for navigation purpose
class AppRoutes {
  /// Private constructor
  AppRoutes._();

  /// Creating instance of App Router
  static final instance = AppRoutes._();

  late String home = containerPage.path;

  String homePage = '/';
  String testPage = 'test-page';
  String textPage = 'text';
  String rowPage = 'row';
  String columnPage = 'column';
  String wrapPage = 'wrap';
  String containerPage = 'container';
}
