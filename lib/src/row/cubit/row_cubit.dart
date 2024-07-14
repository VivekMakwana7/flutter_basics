import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'row_state.dart';

/// Cubit for Handle state of Row Property
class RowCubit extends Cubit<RowState> {
  /// Default constructor
  RowCubit() : super(RowInitial());

  /// Number of Boxes will demonstrate
  int boxes = 3;

  /// Row Property default mainAxisSize
  MainAxisSize mainAxisSize = MainAxisSize.max;

  /// Row Property mainAxisAlignment
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  /// Row Property crossAxisAlignment
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  /// Row Property Text Base Line
  TextBaseline? textBaseline;

  /// Row Property Text Direction
  TextDirection? textDirection;

  /// Row Property Vertical Direction
  VerticalDirection verticalDirection = VerticalDirection.down;

  /// For Increase the box by 1
  void increaseBox() {
    boxes += 1;
    emit(RowBoxIncreaseState());
  }

  /// For Main Axis Size Changed
  void onMainAxisSizeChanged(MainAxisSize? size) {
    mainAxisSize = size ?? MainAxisSize.max;
    emit(RowPropertyUpdateState());
  }

  /// For Main Axis Alignment Changed
  void onMainAxisAlignmentChanged(MainAxisAlignment? alignment) {
    mainAxisAlignment = alignment ?? MainAxisAlignment.start;
    emit(RowPropertyUpdateState());
  }

  /// For Cross Axis Alignment Changed
  void onCrossAxisAlignmentChanged(CrossAxisAlignment? alignment) {
    crossAxisAlignment = alignment ?? CrossAxisAlignment.center;

    if (crossAxisAlignment == CrossAxisAlignment.baseline) {
      textBaseline = TextBaseline.alphabetic;
    } else {
      textBaseline = null;
    }
    emit(RowPropertyUpdateState());
  }

  /// For Text Base Line Changed
  void onTextBaseLineChanged(TextBaseline? baseLine) {
    textBaseline = baseLine;
    emit(RowPropertyUpdateState());
  }

  /// For Text Direction Changed
  void onTextDirectionChanged(TextDirection? direction) {
    textDirection = direction;
    emit(RowPropertyUpdateState());
  }

  /// For Vertical Direction Changed
  void onVerticalDirectionChanged(VerticalDirection? direction) {
    verticalDirection = direction ?? VerticalDirection.down;
    emit(RowPropertyUpdateState());
  }
}
