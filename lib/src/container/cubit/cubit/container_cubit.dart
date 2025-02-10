import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_border.dart';
import 'package:flutter_basics/core/enum/app_border_radius.dart';
import 'package:flutter_basics/core/enum/app_gradient.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';
import 'package:flutter_basics/mixins/border_mixin.dart';
import 'package:flutter_basics/mixins/border_radius_mixin.dart';
import 'package:flutter_basics/mixins/gradient_mixin.dart';
import 'package:flutter_basics/mixins/margin_mixin.dart';
import 'package:flutter_basics/mixins/padding_mixin.dart';

part 'container_state.dart';

/// Container Cubit is for handle Container property
class ContainerCubit extends Cubit<ContainerState>
    with PaddingMixin, MarginMixin, BorderRadiusMixin, GradientMixin, BorderMixin {
  /// Default constructor
  ContainerCubit() : super(ContainerInitial());

  /// [height] is for height of contain widget
  final height = ValueNotifier<double>(100);

  /// [width] is for width of contain widget
  final width = ValueNotifier<double>(100);

  /// [color] is for color of contain widget
  Color color = Colors.red;

  /// [alignment] is for child alignment in box
  AppAlignment? alignment;

  /// For change Container Blend Mode
  BlendMode? blendMode;

  /// For change Container Shapes
  BoxShape boxShape = BoxShape.rectangle;

  /// For change Container color
  void onColorChanged(Color? color) {
    this.color = color ?? Colors.white;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Alignment
  void onAlignmentChanged(AppAlignment? alignment) {
    this.alignment = alignment;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Padding
  void onPaddingChanged(AppPadding? padding) {
    resetMarginValue();
    this.padding = padding;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Margin
  void onMarginChanged(AppPadding? margin) {
    resetMarginValue();
    this.margin = margin;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Border Radius
  void onRadiusChanged(AppBorderRadius? radius) {
    resetRadiusValue();
    this.radius = radius;
    emit(ContainerPropertyUpdateState());
  }

  /// For change BlendMode
  void onBlendModeChanged(BlendMode? blendMode) {
    this.blendMode = blendMode;
    emit(ContainerPropertyUpdateState());
  }

  /// For change BoxShape
  void onBoxShapeChanged(BoxShape? boxShape) {
    // ASSERT : Border Radius and BoxShape can not be applied at same time
    resetRadiusValue();
    radius = null;

    this.boxShape = boxShape ?? BoxShape.rectangle;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient
  void onGradientChanged(AppGradient? gradient) {
    this.gradient = gradient;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient begin Alignment
  void onGradientBeginAlignmentChanged(AppAlignment? alignment) {
    gradientBegin = alignment ?? AppAlignment.topLeft;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient end Alignment
  void onGradientEndAlignmentChanged(AppAlignment? alignment) {
    gradientEnd = alignment ?? AppAlignment.bottomRight;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient tileMode
  void onGradientTileModeChanged(TileMode? tileMode) {
    this.tileMode = tileMode ?? TileMode.clamp;
    emit(ContainerPropertyUpdateState());
  }

  /// For Update Gradient Colors
  void increaseGradientColorBox() {
    isStopsChanged = false;
    gradientColors.value = gradientColors.value + [Colors.white];
    stopController.clear();
  }

  /// On Text Style Font background color changed
  void onGradientColorUpdate({required int index, Color? color}) {
    final list = gradientColors.value.toList();
    list[index] = color ?? Colors.white;
    gradientColors.value = list;
    gradientRadius.value = 0.5;
    focalRadius.value = 0;
    emit(ContainerPropertyUpdateState());
  }

  ///
  void onUpdateStop() {
    if (!isStopsChanged) isStopsChanged = true;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient Center Alignment
  void onGradientCenterAlignmentChanged(AppAlignment? alignment) {
    gradientCenter = alignment ?? AppAlignment.center;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Gradient Focal Alignment
  void onGradientFocalAlignmentChanged(AppAlignment? alignment) {
    focal = alignment;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Border
  void onBorderChanged(AppBorder? border) {
    appBorder = border ?? AppBorder.none;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Top Border Color
  void onTopBorderColorChanged(Color? color) {
    topBorderColor = color ?? Colors.white;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Bottom Border Color
  void onBottomBorderColorChanged(Color? color) {
    bottomBorderColor = color ?? Colors.white;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Left Border Color
  void onLeftBorderColorChanged(Color? color) {
    leftBorderColor = color ?? Colors.white;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Right Border Color
  void onRightBorderColorChanged(Color? color) {
    rightBorderColor = color ?? Colors.white;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Top Border Width
  void onTopBorderStyleChanged(BorderStyle? borderStyle) {
    topBorderStyle = borderStyle ?? BorderStyle.none;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Bottom Border Width
  void onBottomBorderStyleChanged(BorderStyle? borderStyle) {
    bottomBorderStyle = borderStyle ?? BorderStyle.none;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Left Border Width
  void onLeftBorderStyleChanged(BorderStyle? borderStyle) {
    leftBorderStyle = borderStyle ?? BorderStyle.none;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Right Border Width
  void onRightBorderStyleChanged(BorderStyle? borderStyle) {
    rightBorderStyle = borderStyle ?? BorderStyle.none;
    emit(ContainerPropertyUpdateState());
  }

  @override
  Future<void> close() {
    height.dispose();
    width.dispose();
    paddingDispose();
    marginDispose();
    borderRadiusDisposer();
    gradientMixinDispose();
    borderMixinDispose();
    return super.close();
  }
}
