import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_basics/src/wrap/cubit/wrap_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// Wrap page is for demonstrate the [Wrap] widget
class WrapPage extends StatelessWidget {
  /// Default constructor
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WrapCubit(),
      child: BlocBuilder<WrapCubit, WrapState>(
        builder: (context, state) {
          final cubit = context.read<WrapCubit>();
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
                    valueListenable: cubit.spacing,
                    labelText: 'Spacing',
                    onChanged: (value) => cubit.spacing.value = value,
                    min: 0,
                  ),
                  const AppDivider(height: 8),
                  AppSlider(
                    valueListenable: cubit.runSpacing,
                    labelText: 'Run Spacing',
                    onChanged: (value) => cubit.runSpacing.value = value,
                    min: 0,
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: Clip.values
                        .map<DropdownMenuItem<Clip>>(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    labelText: 'Clip Behavoir',
                    value: cubit.clipBehavior,
                    onChanged: cubit.onClipBehaviorChanged,
                  ),
                ],
              ),
              Expanded(
                child: MultiValueListenableBuilder(
                  valueListenables: [
                    cubit.spacing,
                    cubit.runSpacing,
                  ],
                  builder: (BuildContext context, _, Widget? child) => Wrap(
                    crossAxisAlignment: cubit.crossAxisAlignment,
                    verticalDirection: cubit.verticalDirection,
                    alignment: cubit.alignment,
                    direction: cubit.direction,
                    runAlignment: cubit.runAlignment,
                    textDirection: cubit.textDirection,
                    spacing: cubit.spacing.value,
                    runSpacing: cubit.runSpacing.value,
                    clipBehavior: cubit.clipBehavior,
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
