import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_vertical_direction.dart';

part 'wrap_state.dart';

/// Wrap Cubit is for Handle Wrap widget's property
class WrapCubit extends Cubit<WrapState> implements AbsVerticalDirection {
  /// Default constructor
  WrapCubit() : super(WrapInitial());

  /// Number of Boxes are visible on Screen
  int boxes = 3;

  /// Wrap Cross Alignment
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start;

  @override
  VerticalDirection verticalDirection = VerticalDirection.down;

  /// Wrap Align Property
  WrapAlignment alignment = WrapAlignment.start;

  /// Wrap Direction property
  Axis direction = Axis.horizontal;

  /// Wrap Run alignment property
  WrapAlignment runAlignment = WrapAlignment.start;

  /// Wrap Text direction
  TextDirection? textDirection;

  /// Add Box by 1
  void increaseBox() {
    boxes += 1;
    emit(WrapBoxIncreaseState());
  }

  /// for change Wrap Cross Alignment
  void onWrapCrossAlignmentChanged(WrapCrossAlignment? alignment) {
    crossAxisAlignment = alignment ?? WrapCrossAlignment.start;
    emit(WrapPropertyUpdateState());
  }

  @override
  void onVerticalDirectionChanged(VerticalDirection? direction) {
    verticalDirection = direction ?? VerticalDirection.down;
    emit(WrapPropertyUpdateState());
  }

  /// For change Alignment
  void onAlignmentChanged(WrapAlignment? align) {
    alignment = align ?? WrapAlignment.start;
    emit(WrapPropertyUpdateState());
  }

  /// For change Direction
  void onDirectionChanged(Axis? axis) {
    direction = axis ?? Axis.horizontal;
    emit(WrapPropertyUpdateState());
  }

  /// For Run alignment change
  void onRunAlignmentChanged(WrapAlignment? align) {
    runAlignment = align ?? WrapAlignment.start;
    emit(WrapPropertyUpdateState());
  }

  /// For Text Direction Change
  void onTextDirectionChanged(TextDirection? direction) {
    textDirection = direction;
    emit(WrapPropertyUpdateState());
  }
}
