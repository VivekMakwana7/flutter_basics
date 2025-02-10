/// Enum representing different color filter options in an application.
///
/// This enum is used to specify the color filter type when applying filters to images or other visual elements.
enum AppColorFilter {
  /// A color filter that applies a standard mode, such as overlay, saturation, hue, etc.
  mode,

  /// A color filter that applies a matrix transformation to the colors.
  matrix,

  /// A color filter that converts linear color values to sRGB color values using the standard gamma correction.
  linearToSrgbGamma,

  /// A color filter that converts sRGB color values to linear color values using the standard gamma correction.
  srgbToLinearGamma,

  /// A color filter that does not apply any color transformation.
  none,
}

/// Extension on [AppColorFilter] enum to provide convenient boolean checks for each color filter option.
extension ExtAppColorFilter on AppColorFilter {
  /// [isMode]: Returns `true` if the current color filter is [AppColorFilter.mode], otherwise `false`.
  bool get isMode => this == AppColorFilter.mode;

  ///  [isMatrix]: Returns `true` if the current color filter is [AppColorFilter.matrix], otherwise `false`.
  bool get isMatrix => this == AppColorFilter.matrix;

  /// [isLinearToSrgbGamma]: Returns `true` if the current color filter is [AppColorFilter.linearToSrgbGamma], otherwise `false`.
  bool get isLinearToSrgbGamma => this == AppColorFilter.linearToSrgbGamma;

  ///  [isSrgbToLinearGamma]: Returns `true` if the current color filter is [AppColorFilter.srgbToLinearGamma], otherwise `false`.
  bool get isSrgbToLinearGamma => this == AppColorFilter.srgbToLinearGamma;
}
