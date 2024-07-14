import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'column_state.dart';

/// Column Property Cubit
class ColumnCubit extends Cubit<ColumnState> {
  /// Default constructor
  ColumnCubit() : super(ColumnInitial());

  /// Number of Boxes are visible on Screen
  int boxes = 3;

  /// Column Main Axis Size Property
  MainAxisSize mainAxisSize = MainAxisSize.max;

  /// Column Cross Axis Alignment property
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  /// Column Main Axis Alignment property
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  /// Column Text base Line Property
  TextBaseline? textBaseline;

  /// Column Text Direction
  TextDirection? textDirection;

  /// Column Vertical Direction
  VerticalDirection verticalDirection = VerticalDirection.down;

  /// Add Box by 1
  void increaseBox() {
    boxes += 1;
    emit(ColumnBoxIncreaseState());
  }

  /// On Main Axis Size Changed
  void onMainAxisSizeChanged(MainAxisSize? size) {
    mainAxisSize = size ?? MainAxisSize.max;
    emit(ColumnPropertyUpdatetState());
  }

  /// On Cross Axis Alignment Changed
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

  /// On Main Axis Alignment Changed
  void onMainAxisAlignmentChanged(MainAxisAlignment? alignment) {
    mainAxisAlignment = alignment ?? MainAxisAlignment.center;
    emit(ColumnPropertyUpdatetState());
  }

  /// On Main Axis Alignment Changed
  void onTextBaseLineChanged(TextBaseline? line) {
    textBaseline = line;
    emit(ColumnPropertyUpdatetState());
  }

  /// On Text Direction
  void onTextDirectionChanged(TextDirection? direction) {
    textDirection = direction;
    emit(ColumnPropertyUpdatetState());
  }

  /// Column vertical Direction Changed
  void onVerticalDirectionChanged(VerticalDirection? direction) {
    verticalDirection = direction ?? VerticalDirection.down;
    emit(ColumnPropertyUpdatetState());
  }
}
