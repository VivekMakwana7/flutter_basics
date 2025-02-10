import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_basics/src/container/widgets/container_border.dart';
import 'package:flutter_basics/src/container/widgets/container_box_shadow.dart';
import 'package:flutter_basics/src/container/widgets/container_gradient.dart';
import 'package:flutter_basics/src/container/widgets/container_image.dart';
import 'package:flutter_basics/src/container/widgets/container_margin.dart';
import 'package:flutter_basics/src/container/widgets/container_padding.dart';
import 'package:flutter_basics/src/container/widgets/container_radius.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ContainerPropertyWidget] is for demonstration the container property usage
class ContainerPropertyWidget extends StatelessWidget {
  /// Default constructor
  const ContainerPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        final cubit = context.read<ContainerCubit>();
        return PropertyView(
          children: [
            AppSlider(
              key: const ValueKey('container-height'),
              labelText: 'Height',
              valueListenable: cubit.height,
              onChanged: (value) => cubit.height.value = value,
              max: 1000,
            ),
            const AppDivider(height: 8),
            AppSlider(
              key: const ValueKey('container-width'),
              valueListenable: cubit.width,
              onChanged: (value) => cubit.width.value = value,
              labelText: 'Width',
              max: 1000,
            ),
            const AppDivider(height: 8),
            AppColorPicker(
              key: const ValueKey('container-color'),
              labelText: 'Color',
              initialColor: cubit.color,
              onChanged: cubit.onColorChanged,
            ),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('container-alignment'),
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
            const ContainerBorder(),
            const AppDivider(height: 8),
            const ContainerBoxShadow(),
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('container-blend-mode'),
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
            const AppDivider(height: 8),
            AppDropdown(
              key: const ValueKey('container-box-shape'),
              items: BoxShape.values
                  .map<DropdownMenuItem<BoxShape>>(
                    (BoxShape value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  )
                  .toList(),
              onChanged: cubit.onBoxShapeChanged,
              value: cubit.boxShape,
              labelText: 'Box Shape',
            ),
            const AppDivider(height: 8),
            const ContainerGradient(),
            const AppDivider(height: 8),
            const ContainerImage(),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
