import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';

/// Padding Mixin
mixin PaddingMixin {
  /// Padding value
  AppPadding? padding;

  /// Padding value Top
  ValueNotifier<double> paddingTop = ValueNotifier(0);

  /// Padding value Bottom
  ValueNotifier<double> paddingBottom = ValueNotifier(0);

  /// Padding value Left
  ValueNotifier<double> paddingLeft = ValueNotifier(0);

  /// Padding value Right
  ValueNotifier<double> paddingRight = ValueNotifier(0);

  /// Reset padding value
  void resetPaddingValue() {
    paddingTop.value = 0;
    paddingBottom.value = 0;
    paddingLeft.value = 0;
    paddingRight.value = 0;
  }

  /// Get padding value
  EdgeInsetsGeometry get paddingValue {
    switch (padding) {
      case AppPadding.symmetric:
        return EdgeInsets.symmetric(vertical: paddingTop.value, horizontal: paddingLeft.value);
      case AppPadding.all:
        return EdgeInsets.all(paddingTop.value);
      case AppPadding.only:
        return EdgeInsets.only(
            top: paddingTop.value, right: paddingRight.value, left: paddingLeft.value, bottom: paddingBottom.value);
      case AppPadding.ltrb:
        return EdgeInsets.fromLTRB(paddingLeft.value, paddingTop.value, paddingRight.value, paddingBottom.value);
      case AppPadding.zero:
        return EdgeInsets.zero;
      case null:
        return EdgeInsets.zero;
    }
  }

  /// For dispose all ValueNotifier
  void paddingDispose() {
    paddingTop.dispose();
    paddingBottom.dispose();
    paddingLeft.dispose();
    paddingRight.dispose();
  }
}
