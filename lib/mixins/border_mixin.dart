import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_border.dart';

/// A mixin that provides border-related properties and functionality.
/// It uses the [BoxBorder] class to create different types of borders.
mixin BorderMixin {
  /// The type of border to be applied.
  AppBorder appBorder = AppBorder.none;

  /// The color of the top border.
  Color topBorderColor = Colors.green;

  /// The color of the bottom border.
  Color bottomBorderColor = Colors.green;

  /// The color of the left border.
  Color leftBorderColor = Colors.green;

  /// The color of the right border.
  Color rightBorderColor = Colors.green;

  /// Top Border Width
  ValueNotifier<double> topBorderWidth = ValueNotifier(1);

  /// Bottom Border Width
  ValueNotifier<double> bottomBorderWidth = ValueNotifier(1);

  /// Left Border Width
  ValueNotifier<double> leftBorderWidth = ValueNotifier(1);

  /// Right Border Width
  ValueNotifier<double> rightBorderWidth = ValueNotifier(1);

  /// A [ValueNotifier] for the stroke alignment of the border.
  ValueNotifier<double> borderStrokeAlign = ValueNotifier(-1);

  /// A [ValueNotifier] for the stroke alignment of the top border.
  ValueNotifier<double> topBorderStrokeAlign = ValueNotifier(-1);

  /// A [ValueNotifier] for the stroke alignment of the bottom border.
  ValueNotifier<double> bottomBorderStrokeAlign = ValueNotifier(-1);

  /// A [ValueNotifier] for the stroke alignment of the left border.
  ValueNotifier<double> leftBorderStrokeAlign = ValueNotifier(-1);

  /// A [ValueNotifier] for the stroke alignment of the right border.
  ValueNotifier<double> rightBorderStrokeAlign = ValueNotifier(-1);

  /// Bottom  style of the border.
  BorderStyle bottomBorderStyle = BorderStyle.solid;

  /// Top style of the border.
  BorderStyle topBorderStyle = BorderStyle.solid;

  /// Left style of the border.
  BorderStyle leftBorderStyle = BorderStyle.solid;

  /// Right style of the border.
  BorderStyle rightBorderStyle = BorderStyle.solid;

  /// Disposes of [ValueNotifier]s
  void borderMixinDispose() {
    borderStrokeAlign.dispose();
    topBorderWidth.dispose();
    topBorderStrokeAlign.dispose();
    bottomBorderWidth.dispose();
    bottomBorderStrokeAlign.dispose();
    leftBorderWidth.dispose();
    leftBorderStrokeAlign.dispose();
    rightBorderWidth.dispose();
    rightBorderStrokeAlign.dispose();
  }

  /// Returns a [BoxBorder] based on the [appBorder] property.
  BoxBorder? get borderValue {
    switch (appBorder) {
      case AppBorder.sebt:
        return Border(
          bottom: BorderSide(
            style: bottomBorderStyle,
            color: bottomBorderColor,
            width: bottomBorderWidth.value,
            strokeAlign: bottomBorderStrokeAlign.value,
          ),
          top: BorderSide(
            style: topBorderStyle,
            color: topBorderColor,
            width: topBorderWidth.value,
            strokeAlign: topBorderStrokeAlign.value,
          ),
          left: BorderSide(
            style: leftBorderStyle,
            color: leftBorderColor,
            width: leftBorderWidth.value,
            strokeAlign: leftBorderStrokeAlign.value,
          ),
          right: BorderSide(
            style: rightBorderStyle,
            color: rightBorderColor,
            width: rightBorderWidth.value,
            strokeAlign: rightBorderStrokeAlign.value,
          ),
        );
      case AppBorder.all:
        return Border.all(
          style: topBorderStyle,
          color: topBorderColor,
          width: topBorderWidth.value,
          strokeAlign: topBorderStrokeAlign.value,
        );
      case AppBorder.symmetric:
        return Border.symmetric(
          horizontal: BorderSide(
            style: topBorderStyle,
            color: topBorderColor,
            width: topBorderWidth.value,
            strokeAlign: topBorderStrokeAlign.value,
          ),
          vertical: BorderSide(
            style: leftBorderStyle,
            color: leftBorderColor,
            width: leftBorderWidth.value,
            strokeAlign: leftBorderStrokeAlign.value,
          ),
        );
      case AppBorder.fromSide:
        return Border.fromBorderSide(
          BorderSide(
            style: topBorderStyle,
            color: topBorderColor,
            width: topBorderWidth.value,
            strokeAlign: topBorderStrokeAlign.value,
          ),
        );
      case AppBorder.none:
        return null;
    }
  }
}
