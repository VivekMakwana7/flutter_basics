/// Number of available Gradient
enum AppGradient {
  /// Linear Gradient
  linear,

  /// Radial Gradient
  radial,

  /// Sweep Gradient
  sweep,
}

/// Extension on App Gradient
extension AppGradientExtension on AppGradient {
  /// Returns true if the gradient is radial
  bool get isLinear => this == AppGradient.linear;

  /// Returns true if the gradient is linear
  bool get isRadial => this == AppGradient.radial;

  /// Returns true if the gradient is sweep
  bool get isSweep => this == AppGradient.sweep;
}
