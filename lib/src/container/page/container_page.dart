import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// [ContainerPage] is for demonstraints the container property
class ContainerPage extends StatelessWidget {
  /// Default constructor
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerCubit(),
      child: BlocBuilder<ContainerCubit, ContainerState>(
        builder: (context, state) {
          final cubit = context.read<ContainerCubit>();
          return Row(
            children: [
              PropertyWidget(
                children: [
                  AppSlider(
                    labelText: 'Height',
                    valueListenable: cubit.height,
                    onChanged: (value) => cubit.height.value = value,
                  ),
                  const AppDivider(height: 8),
                  AppSlider(
                    valueListenable: cubit.width,
                    onChanged: (value) => cubit.width.value = value,
                    labelText: 'Width',
                  ),
                  const AppDivider(height: 8),
                  AppColorPicker(
                    labelText: 'Color',
                    initialColor: cubit.color,
                    onChanged: cubit.onColorChanged,
                  ),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onAlignmentChanged,
                    value: cubit.alignment,
                    labelText: 'Alignment',
                  ),
                ],
              ),
              Column(
                children: [
                  MultiValueListenableBuilder(
                    valueListenables: [
                      cubit.height,
                      cubit.width,
                    ],
                    builder: (context, _, __) {
                      return Container(
                        height: cubit.height.value,
                        width: cubit.width.value,
                        alignment: cubit.alignment?.alignment,
                        decoration: BoxDecoration(
                          color: cubit.color,
                        ),
                        child: const Text('Box'),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
