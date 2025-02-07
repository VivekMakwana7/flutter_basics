/// App Padding
enum AppPadding {
  /// Padding with symmetric sides [Horizontal, Vertical]
  symmetric,

  /// Padding with all sides
  all,

  /// Padding with given side only
  only,

  /// Padding with left, top, right, and bottom sides
  ltrb,

  /// No padding
  zero,
}

/// Extension on App Padding
extension ExtAppPadding on AppPadding {
  /// Returns true if padding is symmetrical
  bool get isSymmetric => this == AppPadding.symmetric;

  /// Returns true if padding is all sides
  bool get isAll => this == AppPadding.all;

  /// Returns true if padding is only for given side
  bool get isOnly => this == AppPadding.only || this == AppPadding.ltrb;

  /// Returns true if padding is zero
  bool get isZero => this == AppPadding.zero;
}
