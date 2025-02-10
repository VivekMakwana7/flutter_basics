import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_gradient.dart';
import 'package:flutter_basics/core/logger/logger_config.dart';

/// Gradient Mixin
mixin GradientMixin {
  /// App Gradient value
  AppGradient? gradient;

  /// Gradient Tile mode
  TileMode tileMode = TileMode.clamp;

  /// Gradient Alignment
  AppAlignment gradientCenter = AppAlignment.center;

  /// Gradient Start Angle
  ValueNotifier<double> startAngle = ValueNotifier(0);

  /// Gradient End Angle
  ValueNotifier<double> endAngle = ValueNotifier(pi * 2);

  /// Gradient Stops
  List<double>? get stops {
    try {
      return isStopsChanged ? stopController.text.trim().split(',').map(double.parse).toList() : null;
    } on Exception catch (ex) {
      'Exception : $ex'.logE;
      return null;
    }
  }

  /// Gradient transform
  GradientTransform? transform;

  /// Gradient Colors
  ValueNotifier<List<Color>> gradientColors = ValueNotifier([
    Colors.blue,
    Colors.red,
  ]);

  /// Radial Gradient radius
  ValueNotifier<double> gradientRadius = ValueNotifier(0.5);

  /// Radial Gradient focal
  AppAlignment? focal;

  /// Radial Gradient focal radius
  ValueNotifier<double> focalRadius = ValueNotifier(0);

  /// Linear Gradient begin Alignment
  AppAlignment gradientBegin = AppAlignment.topLeft;

  /// Linear Gradient end Alignment
  AppAlignment gradientEnd = AppAlignment.bottomRight;

  ///
  final TextEditingController stopController = TextEditingController();

  /// For handle Stops
  bool isStopsChanged = false;

  ///
  ValueNotifier<double> gradientRadians = ValueNotifier(0);

  /// Return gradient value
  Gradient? get gradientValue {
    switch (gradient) {
      case null:
        return null;
      case AppGradient.linear:
        return LinearGradient(
          colors: gradientColors.value,
          begin: gradientBegin.alignment,
          end: gradientEnd.alignment,
          tileMode: tileMode,
          stops: gradientColors.value.length == stops?.length ? stops : null,
          // As mentioned in Flutter documentation, [transform] property applied in SweepGradient
          /// Base class for transforming gradient shaders without applying the same
          /// transform to the entire canvas.
          ///
          /// For example, a [SweepGradient] normally starts its gradation at 3 o'clock
          /// and draws clockwise. To have the sweep appear to start at 6 o'clock, supply
          /// a [GradientRotation] of `pi/4` radians (i.e. 45 degrees).
          // transform: transform,
        );
      case AppGradient.radial:
        return RadialGradient(
          colors: gradientColors.value,
          center: gradientCenter.alignment,
          tileMode: tileMode,
          stops: gradientColors.value.length == stops?.length ? stops : null,
          radius: gradientRadius.value,
          focal: focal?.alignment,
          focalRadius: focalRadius.value,
          // transform: transform,
        );
      case AppGradient.sweep:
        return SweepGradient(
          colors: gradientColors.value,
          center: gradientCenter.alignment,
          endAngle: endAngle.value,
          tileMode: tileMode,
          startAngle: startAngle.value,
          stops: gradientColors.value.length == stops?.length ? stops : null,
          transform: GradientRotation(gradientRadians.value),
        );
    }
  }

  /// void
  void gradientMixinDispose() {
    gradientColors.dispose();
    stopController.dispose();
    gradientRadius.dispose();
    focalRadius.dispose();
    startAngle.dispose();
    endAngle.dispose();
    gradientRadians.dispose();
  }
}
