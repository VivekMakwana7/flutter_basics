import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';

/// A custom widget that allows users to configure the border style, color, and width of a container.
class ContainerBorderSide extends StatelessWidget {
  /// Creates a new instance of [ContainerBorderSide].
  const ContainerBorderSide({
    required this.borderColor,
    required this.borderWidth,
    required this.title,
    required this.borderStokeAlign,
    required this.max,
    super.key,
    this.borderStyle,
    this.onBorderStyleChanged,
    this.onColorChanged,
    this.onBorderWidthChanged,
    this.onBorderStrokeAlignChanged,
  });

  /// Called when the border style is changed.
  final void Function(BorderStyle?)? onBorderStyleChanged;

  /// The current border style.
  final BorderStyle? borderStyle;

  /// Called when the border color is changed.
  final void Function(Color)? onColorChanged;

  /// The initial color of the border.
  final Color borderColor;

  /// The current value of the border width.
  final ValueNotifier<double?> borderWidth;

  /// The current value of the border width.
  final ValueNotifier<double?> borderStokeAlign;

  /// Called when the border width is changed.
  final void Function(double value)? onBorderWidthChanged;

  /// Called when the border Stroke width is changed.
  final void Function(double value)? onBorderStrokeAlignChanged;

  /// The title of the widget.
  final String title;

  /// The maximum value of the slider.
  final double max;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        AppColorPicker(
          labelText: 'Color',
          initialColor: borderColor,
          onChanged: onColorChanged,
        ),
        const SizedBox(height: 8),
        AppDropdown(
          items: BorderStyle.values
              .map<DropdownMenuItem<BorderStyle>>(
                (BorderStyle value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: onBorderStyleChanged,
          value: borderStyle,
          labelText: 'Border Style',
        ),
        const SizedBox(height: 8),
        AppSlider(
          valueListenable: borderWidth,
          onChanged: onBorderWidthChanged,
          labelText: 'Width',
          max: max,
        ),
        const SizedBox(height: 8),
        AppSlider(
          valueListenable: borderStokeAlign,
          onChanged: onBorderStrokeAlignChanged,
          labelText: 'Stroke Align',
          max: max,
          min: -1,
        ),
      ],
    );
  }
}
