/// Enum representing different types of borders in an application.
///
/// This enum is used to define various border styles in the application.
enum AppBorder {
  /// [AppBorder.sebt]: Represents a border all.
  sebt,

  /// [AppBorder.all]: Represents a border with all four sides.
  all,

  /// [AppBorder.symmetric]: Represents a border with equal width on both horizontal and vertical sides.
  symmetric,

  /// [AppBorder.fromSide]: Represents a border with a specific side defined by the user.
  fromSide,

  ///
  none,
}

/// Extension on AppBorder
extension ExtAppBorder on AppBorder {
  /// Returns `true` if the current [AppBorder] value is [AppBorder.sebt].
  bool get isSebt => this == AppBorder.sebt;

  /// Returns `true` if the current [AppBorder] value is [AppBorder.all].
  bool get isAll => this == AppBorder.all;

  /// Returns `true` if the current [AppBorder] value is [AppBorder.symmetric].
  bool get isSymmetric => this == AppBorder.symmetric;

  /// Returns `true` if the current [AppBorder] value is [AppBorder.fromSide].
  bool get isFromSide => this == AppBorder.fromSide;

  /// Returns `true` if the current [AppBorder] value is [AppBorder.none].
  bool get isNone => this == AppBorder.none;
}
