import 'package:flutter/material.dart';/// Abstract Class for Selection Color Propertyabstract class AbsSelectionColor {  /// Initial Selection Color  Color selectionColor = const Color(0xFFFFFFFF);  /// Abstract Method for change Selection Color Property  void onSelectionColorChanged(Color color);}