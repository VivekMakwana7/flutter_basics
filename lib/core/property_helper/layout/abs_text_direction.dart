import 'package:flutter/material.dart';/// Abstract class for Text Directionabstract class AbsTextDirection {  /// Initial property value  TextDirection? textDirection;  /// Abstract method for change Text Direction  void onTextDirectionChanged(TextDirection? direction);}