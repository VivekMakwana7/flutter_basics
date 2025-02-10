import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_basics/src/row/cubit/row_cubit.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [RowPage] for Row's property demo
class RowPage extends StatelessWidget {
  /// Default constructor
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RowCubit(),
      child: BlocBuilder<RowCubit, RowState>(
        builder: (context, state) {
          final cubit = context.read<RowCubit>();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PropertyView(
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
                        .map<DropdownMenuItem<MainAxisSize>>(
                          (MainAxisSize value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onMainAxisSizeChanged,
                    value: cubit.mainAxisSize,
                    labelText: 'Main Axis Size',
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: MainAxisAlignment.values
                        .map<DropdownMenuItem<MainAxisAlignment>>(
                          (MainAxisAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onMainAxisAlignmentChanged,
                    value: cubit.mainAxisAlignment,
                    labelText: 'Main Axis Alignment',
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: CrossAxisAlignment.values
                        .map<DropdownMenuItem<CrossAxisAlignment>>(
                          (CrossAxisAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onCrossAxisAlignmentChanged,
                    value: cubit.crossAxisAlignment,
                    labelText: 'Cross Axis Alignment',
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: TextBaseline.values
                        .map<DropdownMenuItem<TextBaseline>>(
                          (TextBaseline value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onTextBaseLineChanged,
                    value: cubit.textBaseline,
                    labelText: 'Text Base Line',
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: TextDirection.values
                        .map<DropdownMenuItem<TextDirection>>(
                          (TextDirection value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onTextDirectionChanged,
                    value: cubit.textDirection,
                    labelText: 'Text Direction',
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: VerticalDirection.values
                        .map<DropdownMenuItem<VerticalDirection>>(
                          (VerticalDirection value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onVerticalDirectionChanged,
                    value: cubit.verticalDirection,
                    labelText: 'Vertical Direction',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
