import 'package:flutter/material.dart';
import 'package:flutter_basics/core/ext/ext_build_context.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

/// App Slider Widget
class AppSlider extends StatelessWidget {
  /// Default constructor
  const AppSlider({
    required this.valueListenable,
    required this.labelText,
    super.key,
    this.onChanged,
    this.min = 1,
    this.max = 100,
  });

  /// Value Notifier
  final ValueNotifier<double?> valueListenable;

  /// Label TExt
  final String labelText;

  /// On Value changed
  final void Function(double value)? onChanged;

  /// For set min value
  final double min;

  /// For set max value
  final double max;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        ValueListenableBuilder(
          valueListenable: valueListenable,
          builder: (context, double? value, __) {
            return SfTheme(
              data: SfThemeData(
                sliderThemeData: SfSliderThemeData(
                  tooltipBackgroundColor: context.theme.primaryColor,
                ),
              ),
              child: SfSlider(
                min: min,
                max: max,
                enableTooltip: true,
                value: value ?? 1,
                activeColor: context.theme.primaryColor,
                tooltipShape: const SfPaddleTooltipShape(),
                onChanged: (value) {
                  onChanged?.call(value as double);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
