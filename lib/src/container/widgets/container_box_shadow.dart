import 'package:flutter/material.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container Box Shadow View
class ContainerBoxShadow extends StatelessWidget {
  /// Default constructor
  const ContainerBoxShadow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Box Shadow',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: cubit.increaseBoxShadow,
                  child: const Text('Add 1'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (int index = 0; index < cubit.boxShadows.length; index++) ...[
              AppColorPicker(
                labelText: 'Color',
                initialColor: cubit.boxShadows[index].color,
                onChanged: (color) => cubit.onBoxShadowColor(index: index, color: color),
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.boxShadows[index].dx,
                onChanged: (value) => cubit.boxShadows[index].dx.value = value,
                labelText: 'Offset - dx',
                max: cubit.height.value / 4,
                min: -(cubit.height.value / 4),
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.boxShadows[index].dy,
                onChanged: (value) => cubit.boxShadows[index].dy.value = value,
                labelText: 'Offset - dy',
                max: cubit.height.value / 4,
                min: -(cubit.height.value / 4),
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.boxShadows[index].spreadRadius,
                onChanged: (value) => cubit.boxShadows[index].spreadRadius.value = value,
                labelText: 'Spread Radius',
                max: cubit.height.value / 4,
                min: -(cubit.height.value / 4),
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.boxShadows[index].blurRadius,
                onChanged: (value) => cubit.boxShadows[index].blurRadius.value = value,
                labelText: 'Blur Radius',
              ),
              const SizedBox(height: 6),
              AppDropdown(
                items: BlurStyle.values
                    .map<DropdownMenuItem<BlurStyle>>(
                      (BlurStyle value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => cubit.onBoxShadowBlurStyleChanged(index: index, blurStyle: value),
                value: cubit.boxShadows[index].blurStyle,
                labelText: 'Blur Style',
              ),
              const AppDivider(height: 6),
            ],
          ],
        );
      },
    );
  }
}
