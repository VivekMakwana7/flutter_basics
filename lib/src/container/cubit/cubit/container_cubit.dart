import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';
import 'package:flutter_basics/properties/margin_mixin.dart';
import 'package:flutter_basics/properties/padding_mixin.dart';

part 'container_state.dart';

/// Container Cubit is for handle Container property
class ContainerCubit extends Cubit<ContainerState> with PaddingMixin, MarginMixin {
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

  /// For change Alignment
  void onPaddingChanged(AppPadding? padding) {
    resetMarginValue();
    this.padding = padding;
    emit(ContainerPropertyUpdateState());
  }

  /// For change Alignment
  void onMarginChanged(AppPadding? margin) {
    resetMarginValue();
    this.margin = margin;
    emit(ContainerPropertyUpdateState());
  }

  @override
  Future<void> close() {
    paddingDispose();
    marginDispose();
    return super.close();
  }
}
