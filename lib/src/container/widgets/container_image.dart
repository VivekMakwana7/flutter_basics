import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/core/enum/app_color_filter.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/core/widgets/app_text_field.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Decoration Image Properties
class ContainerImage extends StatelessWidget {
  /// Default constructor
  const ContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        final cubit = context.read<ContainerCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Enable asset image',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Checkbox(
                  value: cubit.isImagePreview,
                  onChanged: (value) => cubit.onImagePreviewEnable(value: value),
                ),
              ],
            ),
            if (cubit.isImagePreview) ...[
              const SizedBox(height: 8),
              AppDropdown(
                items: BoxFit.values
                    .map<DropdownMenuItem<BoxFit>>(
                      (BoxFit value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: cubit.onImageFitChanged,
                value: cubit.imageFit,
                labelText: 'Box Fit',
                labelStyle: const TextStyle(),
              ),
              const SizedBox(height: 6),
              AppDropdown(
                items: AppAlignment.values
                    .map<DropdownMenuItem<AppAlignment>>(
                      (AppAlignment value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: cubit.onImageAlignmentChanged,
                value: cubit.imageAlignment,
                labelText: 'Image Alignment',
                labelStyle: const TextStyle(),
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.scale,
                onChanged: (value) => cubit.scale.value = value,
                labelText: 'Scale',
                max: cubit.height.value,
              ),
              const SizedBox(height: 6),
              AppSlider(
                valueListenable: cubit.opacity,
                onChanged: (value) => cubit.opacity.value = value,
                labelText: 'Opacity',
                max: 1,
                min: 0,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Text('Match Text Direction'),
                  const SizedBox(width: 8),
                  Checkbox(
                    value: cubit.matchTextDirection,
                    onChanged: (value) => cubit.onMatchTextDirectionChanged(value: value),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Text('Inverts color'),
                  const SizedBox(width: 8),
                  Checkbox(
                    value: cubit.invertColors,
                    onChanged: (value) => cubit.onInvertColorChanged(value: value),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Text('Is Anti Alias'),
                  const SizedBox(width: 8),
                  Checkbox(
                    value: cubit.isAntiAlias,
                    onChanged: (value) => cubit.onAntiAliasChanged(value: value),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              AppDropdown(
                items: FilterQuality.values
                    .map<DropdownMenuItem<FilterQuality>>(
                      (FilterQuality value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: cubit.onImageFilterChanged,
                value: cubit.filterQuality,
                labelText: 'Filter Quality',
                labelStyle: const TextStyle(),
              ),
              const SizedBox(height: 8),
              AppDropdown(
                items: AppColorFilter.values
                    .map<DropdownMenuItem<AppColorFilter>>(
                      (AppColorFilter value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: cubit.onImageColorFilterChanged,
                value: cubit.imageColorFilter,
                labelText: 'Image color filter',
                labelStyle: const TextStyle(),
              ),
              const SizedBox(height: 8),
              if (cubit.imageColorFilter?.isMode ?? false) ...[
                AppColorPicker(
                  labelText: 'Image Color',
                  initialColor: cubit.filterColor,
                  onChanged: cubit.onImageFilterColorChanged,
                ),
                const SizedBox(height: 8),
                AppDropdown(
                  items: BlendMode.values
                      .map<DropdownMenuItem<BlendMode>>(
                        (BlendMode value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.name),
                        ),
                      )
                      .toList(),
                  onChanged: cubit.onImageBlendModeChanged,
                  value: cubit.imageBlendMode,
                  labelText: 'Image Blend Mode',
                  labelStyle: const TextStyle(),
                ),
              ],
              if (cubit.imageColorFilter?.isMatrix ?? false) ...[
                AppTextField(
                  labelText: '',
                  controller: cubit.matrixController,
                  hintText: 'Enter 5 x 5 matrix',
                ),
              ],
            ],
          ],
        );
      },
    );
  }
}
