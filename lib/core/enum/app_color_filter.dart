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

// extension on AppColorFilter
extension ExtAppColorFilter on AppColorFilter {
  bool get isMode => this == AppColorFilter.mode;
  bool get isMatrix => this == AppColorFilter.matrix;
  bool get isLinearToSrgbGamma => this == AppColorFilter.linearToSrgbGamma;
  bool get isSrgbToLinearGamma => this == AppColorFilter.srgbToLinearGamma;
}
