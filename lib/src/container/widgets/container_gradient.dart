import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_gradient.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/core/widgets/app_text_field.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container radius View
class ContainerGradient extends StatelessWidget {
  /// Default constructor
  const ContainerGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: cubit.gradientColors,
          builder: (context, _, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDropdown(
                  key: const ValueKey('container-gradient'),
                  items: AppGradient.values
                      .map<DropdownMenuItem<AppGradient>>(
                        (AppGradient value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.name),
                        ),
                      )
                      .toList(),
                  onChanged: cubit.onGradientChanged,
                  value: cubit.gradient,
                  labelText: 'Gradient',
                ),
                const SizedBox(height: 10),
                if (cubit.gradient?.isLinear ?? false) ...[
                  Row(
                    children: [
                      Text(
                        'Number of Boxes : ${cubit.gradientColors.value.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        key: const ValueKey('container-gradient-box-increase'),
                        onPressed: cubit.increaseGradientColorBox,
                        child: const Text('Add 1'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (int index = 0; index < cubit.gradientColors.value.length; index++) ...[
                    AppColorPicker(
                      key: ValueKey('gradient-color-$index'),
                      labelText: 'Color ${index + 1}',
                      initialColor: cubit.gradientColors.value[index],
                      onChanged: (color) => cubit.onGradientColorUpdate(index: index, color: color),
                      labelTextStyle: const TextStyle(),
                    ),
                    const SizedBox(height: 4),
                  ],
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-begin-alignment'),
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientBeginAlignmentChanged,
                    value: cubit.gradientBegin,
                    labelText: 'Begin Alignment',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-end-alignment'),
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientEndAlignmentChanged,
                    value: cubit.gradientEnd,
                    labelText: 'End Alignment',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-tile-mode'),
                    items: TileMode.values
                        .map<DropdownMenuItem<TileMode>>(
                          (TileMode value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientTileModeChanged,
                    value: cubit.tileMode,
                    labelText: 'Tile Mode',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  if (cubit.gradientColors.value.length >= 2)
                    Text(
                      'Stops : ${cubit.gradientColors.value.length}',
                      textAlign: TextAlign.start,
                    ),
                  const SizedBox(height: 10),
                  AppTextField(
                    key: const ValueKey('gradient-stop'),
                    controller: cubit.stopController,
                    labelText: 'Stop',
                    hintText: 'Ex : 0.1, 0.4, 0.8, ...',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9., ]')),
                    ],
                    onChanged: (value) {
                      cubit.onUpdateStop();
                    },
                  ),
                  const SizedBox(height: 6),
                ],
                if (cubit.gradient?.isRadial ?? false) ...[
                  Row(
                    children: [
                      Text(
                        'Number of Boxes : ${cubit.gradientColors.value.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        key: const ValueKey('container-gradient-color-radial-increase'),
                        onPressed: cubit.increaseGradientColorBox,
                        child: const Text('Add 1'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (int index = 0; index < cubit.gradientColors.value.length; index++) ...[
                    AppColorPicker(
                      key: ValueKey('container-gradient-color-$index'),
                      labelText: 'Color ${index + 1}',
                      initialColor: cubit.gradientColors.value[index],
                      onChanged: (color) => cubit.onGradientColorUpdate(index: index, color: color),
                      labelTextStyle: const TextStyle(),
                    ),
                    const SizedBox(height: 4),
                  ],
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-center-alignment'),
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientCenterAlignmentChanged,
                    value: cubit.gradientCenter,
                    labelText: 'Center Alignment',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  AppSlider(
                    key: const ValueKey('container-gradient-radius'),
                    valueListenable: cubit.gradientRadius,
                    onChanged: (value) => cubit.gradientRadius.value = value,
                    labelText: 'Radius',
                    max: 1,
                    min: 0,
                  ),
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-focal-alignment'),
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientFocalAlignmentChanged,
                    value: cubit.focal,
                    labelText: 'Focal Alignment',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  AppSlider(
                    key: const ValueKey('container-gradient-focal-radius'),
                    valueListenable: cubit.focalRadius,
                    onChanged: (value) => cubit.focalRadius.value = value,
                    labelText: 'Focal Radius',
                    max: 1,
                    min: 0,
                  ),
                  AppDropdown(
                    key: const ValueKey('container-gradient-tile-mode'),
                    items: TileMode.values
                        .map<DropdownMenuItem<TileMode>>(
                          (TileMode value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientTileModeChanged,
                    value: cubit.tileMode,
                    labelText: 'Tile Mode',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  if (cubit.gradientColors.value.length >= 2)
                    Text(
                      'Stops : ${cubit.gradientColors.value.length}',
                      textAlign: TextAlign.start,
                    ),
                  const SizedBox(height: 10),
                  AppTextField(
                    key: const ValueKey('gradient-stop'),
                    controller: cubit.stopController,
                    labelText: 'Stop',
                    hintText: 'Ex : 0.1, 0.4, 0.8, ...',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9., ]')),
                    ],
                    onChanged: (value) {
                      cubit.onUpdateStop();
                    },
                  ),
                  const SizedBox(height: 6),
                ],
                if (cubit.gradient?.isSweep ?? false) ...[
                  Row(
                    children: [
                      Text(
                        'Number of Boxes : ${cubit.gradientColors.value.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        key: const ValueKey('container-gradient-color-sweep-increase'),
                        onPressed: cubit.increaseGradientColorBox,
                        child: const Text('Add 1'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (int index = 0; index < cubit.gradientColors.value.length; index++) ...[
                    AppColorPicker(
                      key: ValueKey('gradient-color-$index'),
                      labelText: 'Color ${index + 1}',
                      initialColor: cubit.gradientColors.value[index],
                      onChanged: (color) => cubit.onGradientColorUpdate(index: index, color: color),
                      labelTextStyle: const TextStyle(),
                    ),
                    const SizedBox(height: 4),
                  ],
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-sweep-center-alignment'),
                    items: AppAlignment.values
                        .map<DropdownMenuItem<AppAlignment>>(
                          (AppAlignment value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientCenterAlignmentChanged,
                    value: cubit.gradientCenter,
                    labelText: 'Center Alignment',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  AppSlider(
                    key: const ValueKey('container-gradient-sweep-start-angle'),
                    valueListenable: cubit.startAngle,
                    onChanged: (value) => cubit.startAngle.value = value,
                    labelText: 'Start Angle',
                  ),
                  const SizedBox(height: 8),
                  AppSlider(
                    key: const ValueKey('container-gradient-sweep-end-angle'),
                    valueListenable: cubit.endAngle,
                    onChanged: (value) => cubit.endAngle.value = value,
                    labelText: 'End Angle',
                  ),
                  const SizedBox(height: 8),
                  AppDropdown(
                    key: const ValueKey('container-gradient-tile-mode'),
                    items: TileMode.values
                        .map<DropdownMenuItem<TileMode>>(
                          (TileMode value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name),
                          ),
                        )
                        .toList(),
                    onChanged: cubit.onGradientTileModeChanged,
                    value: cubit.tileMode,
                    labelText: 'Tile Mode',
                    labelStyle: const TextStyle(),
                  ),
                  const SizedBox(height: 8),
                  if (cubit.gradientColors.value.length >= 2)
                    Text(
                      'Stops : ${cubit.gradientColors.value.length}',
                      textAlign: TextAlign.start,
                    ),
                  const SizedBox(height: 6),
                  AppTextField(
                    key: const ValueKey('container-gradient-sweep-stop'),
                    controller: cubit.stopController,
                    labelText: 'Stop',
                    hintText: 'Ex : 0.1, 0.4, 0.8, ...',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9., ]')),
                    ],
                    onChanged: (value) {
                      cubit.onUpdateStop();
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Transform',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 6),
                  AppSlider(
                    key: const ValueKey('container-gradient-sweep-transform-matrix'),
                    valueListenable: cubit.gradientRadians,
                    onChanged: (value) => cubit.gradientRadians.value = value,
                    labelText: 'Radians',
                    min: 0,
                    max: 10,
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
