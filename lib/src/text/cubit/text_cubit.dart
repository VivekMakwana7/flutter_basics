import 'package:bloc/bloc.dart';import 'package:flutter/cupertino.dart';import 'package:flutter_basics/core/logger/logger_config.dart';import 'package:flutter_basics/src/text/enum/app_text_scale.dart';part 'text_state.dart';/// [TextCubit] for handle all state of Text Pageclass TextCubit extends Cubit<TextState> {  /// Initial/Default constructor  TextCubit() : super(TextInitial());  /// For UI text View and modification  final textController =      TextEditingController(text: 'Welcome to flutter basics');  /// Number of line in which text will display  final maxLineController = TextEditingController(text: '1');  /// Text Overflow value  TextOverflow? overflow;  /// TextScaler Value  TextScaler? textScaler;  /// Scale  final scale = ValueNotifier<AppTextScale?>(null);  /// Initial Text Scale value  final textScaleValue = ValueNotifier<double>(1);  /// For Text Alignment  TextAlign? align;  /// Text Selection Color  Color selectionColor = const Color(0xFFFFFFFF);  /// On Text Overflow changed  void onOverflowChanged(TextOverflow? flow) {    overflow = flow;    emit(TextOverflowUpdate());  }  /// On Text Overflow changed  void onTextScaleChanged(AppTextScale? scaleValue) {    if (scaleValue == null) return;    scale.value = scaleValue;    if (scaleValue == AppTextScale.noScaling) {      textScaleValue.value = 1;      textScaler = TextScaler.noScaling;    } else {      textScaler = TextScaler.linear(textScaleValue.value);    }    emit(TextScalerUpdate());  }  /// On Linear text scaler value changed  void onTextScaleValueChanged(double value) {    textScaleValue.value = value;    textScaler = TextScaler.linear(textScaleValue.value);    emit(TextScalerUpdate());  }  /// On Text Alignment changed  void onTextAlignChanged(TextAlign? value) {    align = value;    emit(TextAlignUpdate());  }  /// On Text Selection Color changed  void onTextSelectionColorChanged(Color color) {    selectionColor = color;    'color : $color'.logD;    emit(TextSelectionColorUpdate());  }}