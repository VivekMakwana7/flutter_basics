import 'package:flutter/material.dart';

/// A mixin that provides a list of [BoxShadow] objects based on the [AppBoxShadow] objects.
mixin BoxShadowMixin {
  /// Application Box Shadows
  List<AppBoxShadow> boxShadows = [];

  /// Returns a list of [BoxShadow] objects based on the [AppBoxShadow] objects in [boxShadows].
  ///
  /// Each [BoxShadow] object in the returned list is created using the corresponding [AppBoxShadow] object's properties.
  List<BoxShadow> get boxShadowValue {
    return boxShadows
        .map(
          (e) => BoxShadow(
            spreadRadius: e.spreadRadius.value,
            offset: e.offset,
            blurRadius: e.blurRadius.value,
            color: e.color,
            blurStyle: e.blurStyle,
          ),
        )
        .toList();
  }

  /// Disposes of the [ValueNotifier]s in [boxShadows].
  void boxShadowMixinDispose() {
    boxShadows.map((e) {
      e.dx.dispose();
      e.dy.dispose();
      e.spreadRadius.dispose();
      e.blurRadius.dispose();
    });
  }
}

/// A class representing a box shadow with customizable properties.
class AppBoxShadow {
  /// Default constructor
  AppBoxShadow({
    required this.spreadRadius,
    required this.dx,
    required this.dy,
    required this.blurRadius,
    this.color = Colors.green,
    this.blurStyle = BlurStyle.normal,
  });

  /// The offset of the shadow.
  Offset get offset => Offset(dx.value, dy.value);

  /// The blur radius of the shadow.
  ValueNotifier<double> blurRadius;

  /// The color of the shadow.
  Color color;

  /// The spread radius of the shadow.
  ValueNotifier<double> spreadRadius;

  /// The blur style of the shadow.
  BlurStyle blurStyle;

  /// The x-axis offset of the shadow.
  ValueNotifier<double> dx;

  /// The y-axis offset of the shadow.
  ValueNotifier<double> dy;

  /// Creates a copy of the current [AppBoxShadow] object with the given parameters.
  ///
  /// If a parameter is not provided, the corresponding property of the current object is used.
  void copyWith({
    Color? color,
    BlurStyle? blurStyle,
  }) {
    this.color = color ?? this.color;
    this.blurStyle = blurStyle ?? this.blurStyle;
  }
}
