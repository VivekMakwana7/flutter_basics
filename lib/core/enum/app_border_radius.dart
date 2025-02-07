/// Enum representing different border radius options for an application.
///
/// This enum is used to define various border radius configurations in the application.
///
enum AppBorderRadius {
  /// [zero]: Represents a border radius of 0.
  zero,

  /// [all]: Represents a uniform border radius for all corners.
  all,

  /// [vertical]: Represents a border radius with different values for top and bottom corners.
  vertical,

  /// [horizontal]: Represents a border radius with different values for left and right corners.
  horizontal,

  /// [only]: Represents a border radius with specific values for each corner.
  only,

  /// [circular]: Represents a circular border radius, making the corners round.
  circular,
}

/// Extension on App Border radius
extension AppBorderRadiusExtension on AppBorderRadius {
  /// Returns `true` if the current [AppBorderRadius] is [AppBorderRadius.circular], indicating a circular border radius.
  /// Otherwise, returns `false`.
  bool get isCircular => this == AppBorderRadius.circular;

  /// Returns `true` if the current [AppBorderRadius] is [AppBorderRadius.only], indicating a border radius with specific values for each corner.
  /// Otherwise, returns `false`.
  bool get isOnly => this == AppBorderRadius.only;

  /// Returns `true` if the current [AppBorderRadius] is [AppBorderRadius.horizontal], indicating a border radius with different values for left and right corners.
  /// Otherwise, returns `false`.
  bool get isHorizontal => this == AppBorderRadius.horizontal;

  /// Returns `true` if the current [AppBorderRadius] is [AppBorderRadius.vertical], indicating a border radius with different values for top and bottom corners.
  /// Otherwise, returns `false`.
  bool get isVertical => this == AppBorderRadius.vertical;

  /// Returns `true` if the current [AppBorderRadius] is [AppBorderRadius.all], indicating a uniform border radius for all corners.
  /// Otherwise, returns `false`.
  bool get isAll => this == AppBorderRadius.all;
}
