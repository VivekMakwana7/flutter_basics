import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_basics/src/wrap/cubit/wrap_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wrap Property Widget usages
class WrapPropertyWidget extends StatelessWidget {
  /// Default constructor
  const WrapPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapCubit, WrapState>(
      builder: (context, state) {
        final cubit = context.read<WrapCubit>();
        return PropertyView(
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Number of Boxes : ${cubit.boxes}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  key: const ValueKey('wrap-increase-box'),
                  onPressed: cubit.increaseBox,
                  child: const Text('Add 1'),
                ),
              ],
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-cross-alignment'),
              items: WrapCrossAlignment.values
                  .map<DropdownMenuItem<WrapCrossAlignment>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Wrap Cross Alignment',
              value: cubit.crossAxisAlignment,
              onChanged: cubit.onWrapCrossAlignmentChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-vertical-direction'),
              items: VerticalDirection.values
                  .map<DropdownMenuItem<VerticalDirection>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Vertical Direction',
              value: cubit.verticalDirection,
              onChanged: cubit.onVerticalDirectionChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-alignment'),
              items: WrapAlignment.values
                  .map<DropdownMenuItem<WrapAlignment>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Alignment',
              value: cubit.alignment,
              onChanged: cubit.onAlignmentChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-direction'),
              items: Axis.values
                  .map<DropdownMenuItem<Axis>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Direction',
              value: cubit.direction,
              onChanged: cubit.onDirectionChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-run-alignment'),
              items: WrapAlignment.values
                  .map<DropdownMenuItem<WrapAlignment>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Run Alignment',
              value: cubit.runAlignment,
              onChanged: cubit.onRunAlignmentChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-text-direction'),
              items: TextDirection.values
                  .map<DropdownMenuItem<TextDirection>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Text Direction',
              value: cubit.textDirection,
              onChanged: cubit.onTextDirectionChanged,
            ),
            const AppDivider(height: 8),
            AppSlider(
              key: const ValueKey('wrap-spacing'),
              valueListenable: cubit.spacing,
              labelText: 'Spacing',
              onChanged: (value) => cubit.spacing.value = value,
              min: 0,
            ),
            const AppDivider(height: 8),
            AppSlider(
              key: const ValueKey('wrap-run-spacing'),
              valueListenable: cubit.runSpacing,
              labelText: 'Run Spacing',
              onChanged: (value) => cubit.runSpacing.value = value,
              min: 0,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('wrap-clip-behavior'),
              items: Clip.values
                  .map<DropdownMenuItem<Clip>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Clip Behavior',
              value: cubit.clipBehavior,
              onChanged: cubit.onClipBehaviorChanged,
            ),
          ],
        );
      },
    );
  }
}
