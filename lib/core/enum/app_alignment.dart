import 'package:flutter/material.dart';

/// App Alignment for simplify dropdown
enum AppAlignment {
  /// Top Left corner
  topLeft,

  /// Top Center Corner
  topCenter,

  /// Top right Corner
  topRight,

  /// Center Left Corner
  centerLeft,

  /// Center
  center,

  /// Center right corner
  centerRight,

  /// Bottom left Corner
  bottomLeft,

  /// Bottom Center corner
  bottomCenter,

  /// Bottom right corner
  bottomRight,
}

/// For extra functionality on App Alignment
extension ExtAppAlignment on AppAlignment {
  /// Get Alignment property from App Alignment
  Alignment get alignment {
    switch (this) {
      case AppAlignment.topLeft:
        return Alignment.topLeft;
      case AppAlignment.topCenter:
        return Alignment.topCenter;
      case AppAlignment.topRight:
        return Alignment.topRight;
      case AppAlignment.centerLeft:
        return Alignment.centerLeft;
      case AppAlignment.center:
        return Alignment.center;
      case AppAlignment.centerRight:
        return Alignment.centerRight;
      case AppAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case AppAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case AppAlignment.bottomRight:
        return Alignment.bottomRight;
    }
  }
}
