import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';

/// Margin Mixin
mixin MarginMixin {
  /// Margin value
  AppPadding? margin;

  /// Padding value Top
  ValueNotifier<double> marginTop = ValueNotifier(0);

  /// Padding value Bottom
  ValueNotifier<double> marginBottom = ValueNotifier(0);

  /// Padding value Left
  ValueNotifier<double> marginLeft = ValueNotifier(0);

  /// Padding value Right
  ValueNotifier<double> marginRight = ValueNotifier(0);

  /// Reset padding value
  void resetMarginValue() {
    marginTop.value = 0;
    marginBottom.value = 0;
    marginLeft.value = 0;
    marginRight.value = 0;
  }

  /// Get padding value
  EdgeInsetsGeometry get marginValue {
    switch (margin) {
      case AppPadding.symmetric:
        return EdgeInsets.symmetric(
          vertical: marginTop.value,
          horizontal: marginLeft.value,
        );
      case AppPadding.all:
        return EdgeInsets.all(marginTop.value);
      case AppPadding.only:
        return EdgeInsets.only(
          top: marginTop.value,
          right: marginRight.value,
          left: marginLeft.value,
          bottom: marginBottom.value,
        );
      case AppPadding.ltrb:
        return EdgeInsets.fromLTRB(
          marginLeft.value,
          marginTop.value,
          marginRight.value,
          marginBottom.value,
        );
      case AppPadding.zero:
        return EdgeInsets.zero;
      case null:
        return EdgeInsets.zero;
    }
  }

  /// For dispose all ValueNotifier
  void marginDispose() {
    marginTop.dispose();
    marginBottom.dispose();
    marginLeft.dispose();
    marginRight.dispose();
  }
}
