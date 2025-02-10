import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/src/column/cubit/column_cubit.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ColumnPropertyWidget] for Column's property usages
class ColumnPropertyWidget extends StatelessWidget {
  /// Default constructor
  const ColumnPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColumnCubit, ColumnState>(
      builder: (context, state) {
        final cubit = context.read<ColumnCubit>();
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
                  key: const ValueKey('column-increase-box'),
                  onPressed: cubit.increaseBox,
                  child: const Text('Add 1'),
                ),
              ],
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('column-main-axis-size'),
              items: MainAxisSize.values
                  .map(
                    (e) => DropdownMenuItem<MainAxisSize>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Main Axis Size',
              value: cubit.mainAxisSize,
              onChanged: cubit.onMainAxisSizeChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('column-main-axis-alignment'),
              items: MainAxisAlignment.values
                  .map(
                    (e) => DropdownMenuItem<MainAxisAlignment>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Main Axis Alignment',
              value: cubit.mainAxisAlignment,
              onChanged: cubit.onMainAxisAlignmentChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('column-cross-axis-alignment'),
              items: CrossAxisAlignment.values
                  .map(
                    (e) => DropdownMenuItem<CrossAxisAlignment>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Column Axis Alignment',
              value: cubit.crossAxisAlignment,
              onChanged: cubit.onCrossAxisAlignmentChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('column-text-baseline'),
              items: TextBaseline.values
                  .map(
                    (e) => DropdownMenuItem<TextBaseline>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Text Base Line',
              value: cubit.textBaseline,
              onChanged: cubit.onTextBaseLineChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('column-text-direction'),
              items: TextDirection.values
                  .map(
                    (e) => DropdownMenuItem<TextDirection>(
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
            AppDropdown(
              key: const ValueKey('column-vertical-direction'),
              items: VerticalDirection.values
                  .map(
                    (e) => DropdownMenuItem<VerticalDirection>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              labelText: 'Text Direction',
              value: cubit.verticalDirection,
              onChanged: cubit.onVerticalDirectionChanged,
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
