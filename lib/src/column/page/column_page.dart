import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/src/column/cubit/column_cubit.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Column] property Page
class ColumnPage extends StatelessWidget {
  /// Default constructor
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColumnCubit(),
      child: BlocBuilder<ColumnCubit, ColumnState>(
        builder: (context, state) {
          final cubit = context.read<ColumnCubit>();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PropertyWidget(
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
                        onPressed: cubit.increaseBox,
                        child: const Text('Add 1'),
                      ),
                    ],
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
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
              ),
              Expanded(
                child: Column(
                  mainAxisSize: cubit.mainAxisSize,
                  mainAxisAlignment: cubit.mainAxisAlignment,
                  crossAxisAlignment: cubit.crossAxisAlignment,
                  textBaseline: cubit.textBaseline,
                  textDirection: cubit.textDirection,
                  verticalDirection: cubit.verticalDirection,
                  children: [
                    for (int index = 0; index < cubit.boxes; index++) ...[
                      const BoxWidget(),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
