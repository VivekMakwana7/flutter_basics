import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/core/enum/app_border_radius.dart';

/// For Border Radius
mixin BorderRadiusMixin {
  /// Radius
  AppBorderRadius? radius;

  /// Top radius
  final ValueNotifier<double> radiusTop = ValueNotifier(0);

  /// bottom radius
  final ValueNotifier<double> radiusBottom = ValueNotifier(0);

  /// left radius
  final ValueNotifier<double> radiusLeft = ValueNotifier(0);

  /// right radius
  final ValueNotifier<double> radiusRight = ValueNotifier(0);

  /// Resets the radius values to 0.
  void resetRadiusValue() {
    radiusTop.value = 0;
    radiusBottom.value = 0;
    radiusLeft.value = 0;
    radiusRight.value = 0;
  }

  /// Returns a [BorderRadiusGeometry] based on the [radius] and the values of [radiusTop], [radiusBottom], [radiusLeft], and [radiusRight].
  BorderRadiusGeometry? get radiusValue {
    switch (radius) {
      case AppBorderRadius.zero:
        return BorderRadius.zero;
      case AppBorderRadius.circular:
        return BorderRadius.circular(radiusTop.value);
      case AppBorderRadius.only:
        return BorderRadius.only(
          topLeft: Radius.circular(radiusTop.value),
          topRight: Radius.circular(radiusRight.value),
          bottomLeft: Radius.circular(radiusLeft.value),
          bottomRight: Radius.circular(radiusBottom.value),
        );
      case AppBorderRadius.all:
        return BorderRadius.all(Radius.circular(radiusTop.value));
      case AppBorderRadius.vertical:
        return BorderRadius.vertical(
          bottom: Radius.circular(radiusBottom.value),
          top: Radius.circular(radiusTop.value),
        );
      case AppBorderRadius.horizontal:
        return BorderRadius.horizontal(
          left: Radius.circular(radiusLeft.value),
          right: Radius.circular(radiusRight.value),
        );
      case null:
        return null;
    }
  }

  /// Disposes of the [ValueNotifier] instances for [radiusTop], [radiusBottom], [radiusLeft], and [radiusRight].
  void borderRadiusDisposer() {
    radiusTop.dispose();
    radiusBottom.dispose();
    radiusLeft.dispose();
    radiusRight.dispose();
  }
}
