import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_cross_axis_alignment.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_main_axis_alignment.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_main_axis_size.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_text_base_line.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_text_direction.dart';
import 'package:flutter_basics/core/property_helper/layout/abs_vertical_direction.dart';

part 'column_state.dart';

/// Column Property Cubit
class ColumnCubit extends Cubit<ColumnState>
    implements
        AbsMainAxisSize,
        AbsCrossAxisAlignment,
        AbsMainAxisAlignment,
        AbsTextBaseLine,
        AbsTextDirection,
        AbsVerticalDirection {
  /// Default constructor
  ColumnCubit() : super(ColumnInitial());

  /// Number of Boxes are visible on Screen
  int boxes = 3;

  @override
  MainAxisSize mainAxisSize = MainAxisSize.max;

  @override
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  @override
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  @override
  TextBaseline? textBaseline;

  @override
  TextDirection? textDirection;

  @override
  VerticalDirection verticalDirection = VerticalDirection.down;

  /// Add Box by 1
  void increaseBox() {
    boxes += 1;
    emit(ColumnBoxIncreaseState());
  }

  @override
  void onMainAxisSizeChanged(MainAxisSize? size) {
    mainAxisSize = size ?? MainAxisSize.max;
    emit(ColumnPropertyUpdatetState());
  }

  @override
  void onCrossAxisAlignmentChanged(CrossAxisAlignment? alignment) {
    crossAxisAlignment = alignment ?? CrossAxisAlignment.center;

    /// CrossAxisAlignment's Base line property required Base Line Property
    if (crossAxisAlignment == CrossAxisAlignment.baseline) {
      textBaseline = TextBaseline.alphabetic;
    } else {
      textBaseline = null;
    }

    emit(ColumnPropertyUpdatetState());
  }

  @override
  void onMainAxisAlignmentChanged(MainAxisAlignment? alignment) {
    mainAxisAlignment = alignment ?? MainAxisAlignment.center;
    emit(ColumnPropertyUpdatetState());
  }

  @override
  void onTextBaseLineChanged(TextBaseline? line) {
    textBaseline = line;
    emit(ColumnPropertyUpdatetState());
  }

  @override
  void onTextDirectionChanged(TextDirection? direction) {
    textDirection = direction;
    emit(ColumnPropertyUpdatetState());
  }

  @override
  void onVerticalDirectionChanged(VerticalDirection? direction) {
    verticalDirection = direction ?? VerticalDirection.down;
    emit(ColumnPropertyUpdatetState());
  }
}
