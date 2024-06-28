// ignore_for_file: public_member_api_docsimport 'package:flutter/material.dart';/// App Color Extension for Custom theme color name@immutableclass AppColors extends ThemeExtension<AppColors> {  /// Default constructor  const AppColors({    required this.scaffoldBackground,    required this.sideBarBgColor,    required this.sideBarSelectedColor,  });  final Color scaffoldBackground;  final Color sideBarBgColor;  final Color sideBarSelectedColor;  @override  ThemeExtension<AppColors> copyWith({    Color? scaffoldBackground,    Color? sideBarBgColor,    Color? sideBarSelectedColor,  }) {    return AppColors(      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,      sideBarBgColor: sideBarBgColor ?? this.sideBarBgColor,      sideBarSelectedColor: sideBarSelectedColor ?? this.sideBarSelectedColor,    );  }  @override  ThemeExtension<AppColors> lerp(    covariant ThemeExtension<AppColors>? other,    double t,  ) {    if (other is! AppColors) {      return this;    }    return AppColors(      scaffoldBackground:          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,      sideBarBgColor: Color.lerp(sideBarBgColor, other.sideBarBgColor, t)!,      sideBarSelectedColor:          Color.lerp(sideBarSelectedColor, other.sideBarSelectedColor, t)!,    );  }}/// Text Theme Color Extensionclass TextThemeColors extends ThemeExtension<TextThemeColors> {  /// Default constructor  const TextThemeColors({    required this.textColor,  });  @override  ThemeExtension<TextThemeColors> copyWith({Color? textColor}) {    return TextThemeColors(textColor: textColor ?? this.textColor);  }  @override  ThemeExtension<TextThemeColors> lerp(    covariant ThemeExtension<TextThemeColors>? other,    double t,  ) {    if (other is! TextThemeColors) {      return this;    }    return TextThemeColors(      textColor: Color.lerp(textColor, other.textColor, t)!,    );  }  final Color textColor;}