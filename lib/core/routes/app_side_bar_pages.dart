import 'package:flutter_basics/core/routes/app_routes.dart';

/// Side Bar Page Enum
enum SideBarPage {
  /// Text Page
  text,

  /// Row Page
  row,

  /// Column Page
  column,

  /// Wrap Page
  wrap,

  /// Container Page
  container;
}

/// Extension on Side Bar Page
extension ExtSideBarPage on SideBarPage {
  /// Get Title text
  String get title {
    switch (this) {
      case SideBarPage.text:
        return 'Text';
      case SideBarPage.row:
        return 'Row';
      case SideBarPage.column:
        return 'Column';
      case SideBarPage.wrap:
        return 'Wrap';
      case SideBarPage.container:
        return 'Container';
    }
  }

  /// Navigation Path
  String get path {
    switch (this) {
      case SideBarPage.text:
        return AppRoutes.textPage;
      case SideBarPage.row:
        return AppRoutes.rowPage;
      case SideBarPage.column:
        return AppRoutes.columnPage;
      case SideBarPage.wrap:
        return AppRoutes.wrapPage;
      case SideBarPage.container:
        return AppRoutes.containerPage;
    }
  }
}
