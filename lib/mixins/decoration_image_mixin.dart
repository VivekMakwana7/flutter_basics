import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_color_filter.dart';

/// A mixin that provides properties and methods for configuring a [DecorationImage].
mixin DecorationImageMixin {
  /// Indicates whether the image should be displayed as a preview.
  bool isImagePreview = false;

  /// The fit option for the image.
  BoxFit? imageFit;

  /// The alignment of the image within the box.
  AppAlignment imageAlignment = AppAlignment.center;

  /// Whether to match the text direction when aligning the image.
  bool matchTextDirection = false;

  /// How to paint any portions of the box that are not covered by the image.
  ImageRepeat repeat = ImageRepeat.noRepeat;

  /// A [ValueNotifier] for controlling the scale of the image.
  ValueNotifier<double> scale = ValueNotifier(1);

  /// A [ValueNotifier] for controlling the opacity of the image.
  ValueNotifier<double> opacity = ValueNotifier(1);

  /// The quality of the filter applied to the image.
  FilterQuality filterQuality = FilterQuality.medium;

  /// Whether to invert the colors of the image.
  bool invertColors = false;

  /// Whether to apply anti-aliasing to the image.
  bool isAntiAlias = false;

  /// The color filter to apply to the image.
  AppColorFilter? imageColorFilter;

  /// The color to use when applying a color filter.
  Color filterColor = Colors.white;

  /// The blend mode to use when applying a color filter.
  BlendMode imageBlendMode = BlendMode.src;

  /// A [TextEditingController] for controlling the matrix color filter.
  final TextEditingController matrixController = TextEditingController();

  /// Returns a [ColorFilter] based on the current [imageColorFilter] setting.
  ColorFilter? get colorFilter {
    switch (imageColorFilter) {
      case null:
        return null;
      case AppColorFilter.mode:
        return ColorFilter.mode(filterColor, imageBlendMode);
      case AppColorFilter.matrix:
        return ColorFilter.matrix(matrixController.text.trim().split(',').map(double.parse).toList());
      case AppColorFilter.linearToSrgbGamma:
        return const ColorFilter.linearToSrgbGamma();
      case AppColorFilter.srgbToLinearGamma:
        return const ColorFilter.srgbToLinearGamma();
      case AppColorFilter.none:
        return null;
    }
  }

  /// Disposes of the [scale], [opacity], and [matrixController].
  void decorationImageMixinDispose() {
    scale.dispose();
    opacity.dispose();
    matrixController.dispose();
  }
}
