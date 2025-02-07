import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_border_radius.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';
import 'package:flutter_basics/mixins/border_radius_mixin.dart';
import 'package:flutter_basics/mixins/margin_mixin.dart';
import 'package:flutter_basics/mixins/padding_mixin.dart';

part 'container_state.dart';

/// Container Cubit is for handle Container property
class ContainerCubit extends Cubit<ContainerState> with PaddingMixin, MarginMixin, BorderRadiusMixin {
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

  @override
  Future<void> close() {
    height.dispose();
    width.dispose();
    paddingDispose();
    marginDispose();
    borderRadiusDisposer();
    return super.close();
  }
}
