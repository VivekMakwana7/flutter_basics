import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:meta/meta.dart';

part 'container_state.dart';

/// Container Cubit is for handle Container property
class ContainerCubit extends Cubit<ContainerState> {
  /// Default constructor
  ContainerCubit() : super(ContainerInitial());

  /// [height] is for height of containe widget
  final height = ValueNotifier<double>(10);

  /// [width] is for width of containe widget
  final width = ValueNotifier<double>(10);

  /// [color] is for color of containe widget
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
}
