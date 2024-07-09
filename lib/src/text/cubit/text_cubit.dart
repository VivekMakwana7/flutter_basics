import 'package:bloc/bloc.dart';import 'package:flutter/cupertino.dart';import 'package:flutter_basics/core/theme/app_theme.dart';import 'package:flutter_basics/src/text/enum/app_text_scale.dart';part 'text_state.dart';/// [TextCubit] for handle all state of Text Pageclass TextCubit extends Cubit<TextState> {  /// Initial/Default constructor  TextCubit() : super(TextInitial());  /// For UI text View and modification  final textController =      TextEditingController(text: 'Welcome to flutter basics');  /// Number of line in which text will display  final maxLineController = TextEditingController(text: '1');  /// Text Overflow value  TextOverflow? overflow;  /// TextScaler Value  TextScaler? textScaler;  /// Scale  final scale = ValueNotifier<AppTextScale?>(null);  /// Initial Text Scale value  final textScaleValue = ValueNotifier<double>(1);  /// For Text Alignment  TextAlign? align;  /// Text Selection Color  Color selectionColor = const Color(0xFFFFFFFF);  /// Text Width basis  TextWidthBasis? textWidthBasis;  /// Text Apply Height To ascent  bool applyHeightToAscent = true;  /// Text Apply Height To ascent  bool applyHeightToDescent = true;  /// Text Leading Distribution  TextLeadingDistribution textLeadingDistribution =      TextLeadingDistribution.proportional;  /// Text Soft wrap  bool? softWrap;  /// Text style font size  final fontSize = ValueNotifier<double?>(null);  /// Text Font weight  FontWeight? fontWeight;  /// Available Font Family  FontFamilyEnum? fontFamily;  /// Text Font Color  Color? fontColor;  /// Text Font Background color  Color? fontBackgroundColor;  /// Text Font Style  FontStyle? fontStyle;  /// Text Decoration  TextDecoration? textDecoration;  /// Text Style Decoration color  Color? decorationColor;  /// Text Decoration Style  TextDecorationStyle? textDecorationStyle;  /// Decoration Thickness  final decorationThickness = ValueNotifier<double?>(null);  /// Text Style's height property  final height = ValueNotifier<double?>(null);  /// Text Style's word spacing  final wordSpacing = ValueNotifier<double?>(null);  @override  Future<void> close() {    textController.dispose();    maxLineController.dispose();    scale.dispose();    textScaleValue.dispose();    fontSize.dispose();    decorationThickness.dispose();    height.dispose();    wordSpacing.dispose();    return super.close();  }  /// On Text Overflow changed  void onOverflowChanged(TextOverflow? flow) {    overflow = flow;    emit(TextPropertyUpdateState());  }  /// On Text Overflow changed  void onTextScaleChanged(AppTextScale? scaleValue) {    if (scaleValue == null) return;    scale.value = scaleValue;    if (scaleValue == AppTextScale.noScaling) {      textScaleValue.value = 1;      textScaler = TextScaler.noScaling;    } else {      textScaler = TextScaler.linear(textScaleValue.value);    }    emit(TextPropertyUpdateState());  }  /// On Linear text scaler value changed  void onTextScaleValueChanged(double value) {    textScaleValue.value = value;    textScaler = TextScaler.linear(textScaleValue.value);    emit(TextPropertyUpdateState());  }  /// On Text Alignment changed  void onTextAlignChanged(TextAlign? value) {    align = value;    emit(TextPropertyUpdateState());  }  /// On Text Selection Color changed  void onTextSelectionColorChanged(Color color) {    selectionColor = color;    emit(TextPropertyUpdateState());  }  /// On Text Width Basis Changed  void onTextWidthBasisChanged(TextWidthBasis? basis) {    textWidthBasis = basis;    emit(TextPropertyUpdateState());  }  /// On Text Apply Height to ascent changed  void onTextApplyHeightToAscentChanged({required bool value}) {    applyHeightToAscent = value;    emit(TextPropertyUpdateState());  }  /// On Text Apply Height to ascent changed  void onTextApplyHeightToDescentChanged({required bool value}) {    applyHeightToDescent = value;    emit(TextPropertyUpdateState());  }  /// On Text Leading Distribution changed  void onTextLeadingDistributionChanged(TextLeadingDistribution? distribution) {    if (distribution == null) return;    textLeadingDistribution = distribution;    emit(TextPropertyUpdateState());  }  /// On Text Soft Wrap Changed  void onTextSoftWrapChanged({required bool value}) {    softWrap = value;    emit(TextPropertyUpdateState());  }  /// On Text Font Weight Changed  void onTextFontWeightChanged(FontWeight? weight) {    fontWeight = weight;    emit(TextStyleUpdateState());  }  /// On Text Font Family changed  void onTextFontFamilyChanged(FontFamilyEnum? family) {    fontFamily = family;    emit(TextStyleUpdateState());  }  /// On Text style Font color changed  void onTextFontColorChanged(Color? color) {    fontColor = color;    emit(TextStyleUpdateState());  }  /// On Text Style Font background color changed  void onTextFontBackgroundColorChanged(Color? color) {    fontBackgroundColor = color;    emit(TextStyleUpdateState());  }  /// On Text Style Font Style Changed  void onTextFontStyleChanged(FontStyle? style) {    fontStyle = style;    emit(TextStyleUpdateState());  }  /// On Text Style Text Decoration Changed  void onTextDecorationChanged(TextDecoration? decoration) {    textDecoration = decoration;    emit(TextStyleUpdateState());  }  /// On Text Style Decoration color Changed  void onTextDecorationColorChanged(Color? color) {    decorationColor = color;    emit(TextStyleUpdateState());  }  /// On Text Decoration Style Changed  void onTextDecorationStyleChanged(TextDecorationStyle? style) {    textDecorationStyle = style;    emit(TextStyleUpdateState());  }}