import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_basics/src/container/widgets/container_margin.dart';
import 'package:flutter_basics/src/container/widgets/container_padding.dart';
import 'package:flutter_basics/src/container/widgets/container_radius.dart';
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
                    max: 1000,
                  ),
                  const AppDivider(height: 8),
                  AppSlider(
                    valueListenable: cubit.width,
                    onChanged: (value) => cubit.width.value = value,
                    labelText: 'Width',
                    max: 1000,
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
                  const AppDivider(height: 8),
                  const ContainerPadding(),
                  const AppDivider(height: 8),
                  const ContainerMargin(),
                  const AppDivider(height: 8),
                  const ContainerRadius(),
                  const AppDivider(height: 8),
                  AppDropdown(
                    items: BlendMode.values
                        .map<DropdownMenuItem<BlendMode>>(
                          (BlendMode value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onBlendModeChanged,
                    value: cubit.blendMode,
                    labelText: 'Blend Mode',
                  ),
                ],
              ),
              MultiValueListenableBuilder(
                valueListenables: [
                  cubit.height,
                  cubit.width,
                  cubit.paddingTop,
                  cubit.paddingBottom,
                  cubit.paddingLeft,
                  cubit.paddingRight,
                  cubit.marginTop,
                  cubit.marginBottom,
                  cubit.marginLeft,
                  cubit.marginRight,
                  cubit.radiusTop,
                  cubit.radiusBottom,
                  cubit.radiusLeft,
                  cubit.radiusRight,
                ],
                builder: (context, _, __) {
                  return Container(
                    height: cubit.height.value,
                    width: cubit.width.value,
                    alignment: cubit.alignment?.alignment,
                    padding: cubit.paddingValue,
                    margin: cubit.marginValue,
                    decoration: BoxDecoration(
                      color: cubit.color,
                      borderRadius: cubit.radiusValue,
                      backgroundBlendMode: cubit.blendMode,
                    ),
                    child: const Text('Box'),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
