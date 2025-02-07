import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';

/// Padding Mixin
mixin PaddingMixin {
  /// Padding value
  AppPadding? padding;

  /// Padding value Top
  ValueNotifier<double> top = ValueNotifier(0);

  /// Padding value Bottom
  ValueNotifier<double> bottom = ValueNotifier(0);

  /// Padding value Left
  ValueNotifier<double> left = ValueNotifier(0);

  /// Padding value Right
  ValueNotifier<double> right = ValueNotifier(0);

  /// Reset padding value
  void resetPaddingValue() {
    top.value = 0;
    bottom.value = 0;
    left.value = 0;
    right.value = 0;
  }

  /// Get padding value
  EdgeInsetsGeometry get paddingValue {
    switch (padding) {
      case AppPadding.symmetric:
        return EdgeInsets.symmetric(vertical: top.value, horizontal: left.value);
      case AppPadding.all:
        return EdgeInsets.all(top.value);
      case AppPadding.only:
        return EdgeInsets.only(top: top.value, right: right.value, left: left.value, bottom: bottom.value);
      case AppPadding.ltrb:
        return EdgeInsets.fromLTRB(left.value, top.value, right.value, bottom.value);
      case AppPadding.zero:
        return EdgeInsets.zero;
      case null:
        return EdgeInsets.zero;
    }
  }

  /// For dispose all ValueNotifier
  void paddingDispose() {
    top.dispose();
  }
}
