import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/core/property_helper/layout/layout_helper.dart';

part 'row_state.dart';

/// Cubit for Handle state of Row Property
class RowCubit extends Cubit<RowState>
    implements
        AbsMainAxisSize,
        AbsMainAxisAlignment,
        AbsCrossAxisAlignment,
        AbsTextBaseLine,
        AbsTextDirection,
        AbsVerticalDirection {
  /// Default constructor
  RowCubit() : super(RowInitial());

  /// Number of Boxes will demonstrate
  int boxes = 3;

  @override
  MainAxisSize mainAxisSize = MainAxisSize.max;

  @override
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  @override
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  @override
  TextBaseline? textBaseline;

  @override
  TextDirection? textDirection;

  @override
  VerticalDirection verticalDirection = VerticalDirection.down;

  /// For Increase the box by 1
  void increaseBox() {
    boxes += 1;
    emit(RowBoxIncreaseState());
  }

  @override
  void onMainAxisSizeChanged(MainAxisSize? size) {
    mainAxisSize = size ?? MainAxisSize.max;
    emit(RowPropertyUpdateState());
  }

  @override
  void onMainAxisAlignmentChanged(MainAxisAlignment? alignment) {
    mainAxisAlignment = alignment ?? MainAxisAlignment.start;
    emit(RowPropertyUpdateState());
  }

  @override
  void onCrossAxisAlignmentChanged(CrossAxisAlignment? alignment) {
    crossAxisAlignment = alignment ?? CrossAxisAlignment.center;

    if (crossAxisAlignment == CrossAxisAlignment.baseline) {
      textBaseline = TextBaseline.alphabetic;
    } else {
      textBaseline = null;
    }
    emit(RowPropertyUpdateState());
  }

  @override
  void onTextBaseLineChanged(TextBaseline? baseLine) {
    textBaseline = baseLine;
    emit(RowPropertyUpdateState());
  }

  @override
  void onTextDirectionChanged(TextDirection? direction) {
    textDirection = direction;
    emit(RowPropertyUpdateState());
  }

  @override
  void onVerticalDirectionChanged(VerticalDirection? direction) {
    verticalDirection = direction ?? VerticalDirection.down;
    emit(RowPropertyUpdateState());
  }
}
