import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/core/widgets/app_switch.dart';
import 'package:flutter_basics/core/widgets/app_text_field.dart';
import 'package:flutter_basics/src/main/property_widget.dart';
import 'package:flutter_basics/src/text/cubit/text_cubit.dart';
import 'package:flutter_basics/src/text/enum/app_text_scale.dart';
import 'package:flutter_basics/src/text/widgets/text_style_property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// [TextPropertyWidget] for all text property usages
class TextPropertyWidget extends StatelessWidget {
  /// Default constructor
  const TextPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TextCubit>();
    return PropertyView(
      children: <Widget>[
        const SizedBox(height: 24),
        AppTextField(
          key: const ValueKey('text-enter-text'),
          labelText: 'Write text for better output',
          hintText: 'Enter text...',
          controller: cubit.textController,
          maxLines: 5,
        ),
        const AppDivider(height: 8),
        const TextStylePropertyWidget(),
        const AppDivider(height: 8),
        AppTextField(
          key: const ValueKey('text-enter-max-line'),
          labelText: 'Max Line',
          hintText: '1',
          controller: cubit.maxLineController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
        ),
        const AppDivider(height: 8),
        AppDropdown(
          key: const ValueKey('text-text-overflow'),
          items: TextOverflow.values
              .map<DropdownMenuItem<TextOverflow>>(
                (TextOverflow value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: cubit.onOverflowChanged,
          value: cubit.overflow,
          labelText: 'Text Overflow',
        ),
        const AppDivider(height: 8),
        AppDropdown<AppTextScale>(
          key: const ValueKey('text-text-scale'),
          items: AppTextScale.values
              .map<DropdownMenuItem<AppTextScale>>(
                (AppTextScale value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: cubit.onTextScaleChanged,
          value: cubit.scale.value,
          labelText: 'Text Scale',
        ),
        MultiValueListenableBuilder(
          valueListenables: [
            cubit.scale,
            cubit.textScaleValue,
          ],
          builder: (context, value, child) {
            return cubit.scale.value == AppTextScale.linear
                ? AppSlider(
                    valueListenable: cubit.textScaleValue,
                    labelText: '',
                    onChanged: (value) => cubit.textScaleValue.value = value,
                    min: 0,
                    max: 10,
                  )
                : const SizedBox.shrink();
          },
        ),
        const AppDivider(height: 8),
        AppDropdown<TextAlign>(
          key: const ValueKey('text-text-align'),
          items: TextAlign.values
              .map<DropdownMenuItem<TextAlign>>(
                (TextAlign value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: cubit.onTextAlignChanged,
          value: cubit.align,
          labelText: 'Text Align',
        ),
        const AppDivider(height: 8),
        AppColorPicker(
          key: const ValueKey('text-selection-color'),
          labelText: 'Selection Color',
          initialColor: cubit.selectionColor,
          onChanged: cubit.onSelectionColorChanged,
        ),
        const AppDivider(height: 8),
        AppSwitch(
          key: const ValueKey('text-soft-wrap'),
          labelText: 'Soft Wrap',
          value: cubit.softWrap ?? false,
          onChanged: (value) => cubit.onTextSoftWrapChanged(value: value),
        ),
        const AppDivider(height: 8),
        AppDropdown<TextWidthBasis>(
          key: const ValueKey('text-text-width-basis'),
          items: TextWidthBasis.values
              .map<DropdownMenuItem<TextWidthBasis>>(
                (TextWidthBasis value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: cubit.onTextWidthBasisChanged,
          value: cubit.textWidthBasis,
          labelText: 'Text Width Basis',
        ),
        const AppDivider(height: 8),
        const Text(
          'Text Height Behavior',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        AppSwitch(
          key: const ValueKey('text-apply-height-to-ascent'),
          labelText: 'Apply Height To Ascent',
          value: cubit.applyHeightToAscent,
          onChanged: (value) => cubit.onTextApplyHeightToAscentChanged(value: value),
        ),
        const SizedBox(height: 8),
        AppSwitch(
          key: const ValueKey('text-apply-height-to-descent'),
          labelText: 'Apply Height To Descent',
          value: cubit.applyHeightToDescent,
          onChanged: (value) => cubit.onTextApplyHeightToDescentChanged(value: value),
        ),
        const SizedBox(height: 8),
        AppDropdown<TextLeadingDistribution>(
          key: const ValueKey('text-text-leading-distribution'),
          items: TextLeadingDistribution.values
              .map<DropdownMenuItem<TextLeadingDistribution>>(
                (TextLeadingDistribution value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                ),
              )
              .toList(),
          onChanged: cubit.onTextLeadingDistributionChanged,
          value: cubit.textLeadingDistribution,
          labelText: 'Text Leading Distribution',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
