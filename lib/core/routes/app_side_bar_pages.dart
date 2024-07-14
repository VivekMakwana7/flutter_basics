import 'package:flutter_basics/core/routes/app_routes.dart';

/// Side Bar Page Enum
enum SideBarPage {
  /// Text Page
  text,

  /// Row Page
  row;
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
    }
  }

  /// Navigation Path
  String get path {
    switch (this) {
      case SideBarPage.text:
        return AppRoutes.instance.textPage;
      case SideBarPage.row:
        return AppRoutes.instance.rowPage;
    }
  }
}
