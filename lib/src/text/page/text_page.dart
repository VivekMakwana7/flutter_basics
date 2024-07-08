import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:flutter_basics/core/theme/app_theme.dart';import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';import 'package:flutter_basics/core/widgets/app_divider.dart';import 'package:flutter_basics/core/widgets/app_dropdown.dart';import 'package:flutter_basics/core/widgets/app_switch.dart';import 'package:flutter_basics/core/widgets/app_text_field.dart';import 'package:flutter_basics/src/text/cubit/text_cubit.dart';import 'package:flutter_basics/src/text/enum/app_text_scale.dart';import 'package:flutter_basics/src/widgets/property_widget.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';import 'package:syncfusion_flutter_sliders/sliders.dart';/// [TextPage] for all text property usagesclass TextPage extends StatelessWidget {  /// Default constructor  const TextPage({super.key});  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => TextCubit(),      child: BlocBuilder<TextCubit, TextState>(        builder: (context, state) {          final cubit = context.read<TextCubit>();          return Row(            crossAxisAlignment: CrossAxisAlignment.stretch,            children: [              PropertyWidget(                children: <Widget>[                  const SizedBox(height: 24),                  AppTextField(                    key: const ValueKey('text-enter-text'),                    labelText: 'Write text for better output',                    hintText: 'Enter text...',                    controller: cubit.textController,                    maxLines: 5,                  ),                  const AppDivider(height: 8),                  const Text(                    'Text Style',                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),                  ),                  const SizedBox(height: 8),                  const Text('Font Size'),                  ValueListenableBuilder(                    valueListenable: cubit.fontSize,                    builder: (context, _, __) {                      return SfSlider(                        min: 1,                        max: 100,                        enableTooltip: true,                        value: cubit.fontSize.value ?? 1,                        onChanged: (value) {                          cubit.fontSize.value = value as double;                        },                      );                    },                  ),                  const SizedBox(height: 8),                  AppDropdown(                    value: cubit.fontWeight,                    items: FontWeight.values                        .map<DropdownMenuItem<FontWeight>>(                          (FontWeight value) => DropdownMenuItem(                            value: value,                            child: Text(value.toString()),                          ),                        )                        .toList(),                    labelText: 'Font Weight',                    labelStyle: const TextStyle(),                    onChanged: cubit.onTextFontWeightChanged,                  ),                  const SizedBox(height: 8),                  AppDropdown(                    value: cubit.fontFamily,                    items: FontFamilyEnum.values                        .map<DropdownMenuItem<FontFamilyEnum>>(                          (FontFamilyEnum value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    labelText: 'Font Family',                    labelStyle: const TextStyle(),                    onChanged: cubit.onTextFontFamilyChanged,                  ),                  const SizedBox(height: 8),                  AppColorPicker(                    labelText: 'Font color',                    initialColor: cubit.fontColor ?? Colors.white,                    onChanged: cubit.onTextFontColorChanged,                    labelTextStyle: const TextStyle(),                  ),                  const AppDivider(height: 8),                  const SizedBox(height: 8),                  AppTextField(                    key: const ValueKey('text-enter-max-line'),                    labelText: 'Max Line',                    hintText: '1',                    controller: cubit.maxLineController,                    keyboardType: TextInputType.number,                    inputFormatters: [                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),                    ],                  ),                  const SizedBox(height: 16),                  AppDropdown(                    key: const ValueKey('text-text-overflow'),                    items: TextOverflow.values                        .map<DropdownMenuItem<TextOverflow>>(                          (TextOverflow value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onOverflowChanged,                    value: cubit.overflow,                    labelText: 'Text Overflow',                  ),                  const SizedBox(height: 16),                  AppDropdown<AppTextScale>(                    key: const ValueKey('text-text-scale'),                    items: AppTextScale.values                        .map<DropdownMenuItem<AppTextScale>>(                          (AppTextScale value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextScaleChanged,                    value: cubit.scale.value,                    labelText: 'Text Scaler',                  ),                  MultiValueListenableBuilder(                    valueListenables: [                      cubit.scale,                      cubit.textScaleValue,                    ],                    builder: (context, value, child) {                      return cubit.scale.value == AppTextScale.linear                          ? SfSlider(                              min: 0,                              max: 10,                              value: cubit.textScaleValue.value,                              onChanged: (value) {                                cubit.onTextScaleValueChanged(value as double);                              },                              enableTooltip: true,                            )                          : const SizedBox.shrink();                    },                  ),                  const SizedBox(height: 16),                  AppDropdown<TextAlign>(                    key: const ValueKey('text-text-align'),                    items: TextAlign.values                        .map<DropdownMenuItem<TextAlign>>(                          (TextAlign value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextAlignChanged,                    value: cubit.align,                    labelText: 'Text Align',                  ),                  const SizedBox(height: 16),                  AppColorPicker(                    key: const ValueKey('text-selection-color'),                    labelText: 'Selection Color',                    initialColor: cubit.selectionColor,                    onChanged: cubit.onTextSelectionColorChanged,                  ),                  const SizedBox(height: 16),                  AppSwitch(                    key: const ValueKey('text-soft-wrap'),                    labelText: 'Soft Wrap',                    value: cubit.softWrap ?? false,                    onChanged: (value) =>                        cubit.onTextSoftWrapChanged(value: value),                  ),                  const SizedBox(height: 16),                  AppDropdown<TextWidthBasis>(                    key: const ValueKey('text-text-width-basis'),                    items: TextWidthBasis.values                        .map<DropdownMenuItem<TextWidthBasis>>(                          (TextWidthBasis value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextWidthBasisChanged,                    value: cubit.textWidthBasis,                    labelText: 'Text Width Basis',                  ),                  const AppDivider(height: 8),                  const Text(                    'Text Height Behavior',                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),                  ),                  const SizedBox(height: 8),                  AppSwitch(                    key: const ValueKey('text-apply-height-to-ascent'),                    labelText: 'Apply Height To Ascent',                    value: cubit.applyHeightToAscent,                    onChanged: (value) =>                        cubit.onTextApplyHeightToAscentChanged(value: value),                  ),                  const SizedBox(height: 8),                  AppSwitch(                    key: const ValueKey('text-apply-height-to-descent'),                    labelText: 'Apply Height To Descent',                    value: cubit.applyHeightToDescent,                    onChanged: (value) =>                        cubit.onTextApplyHeightToDescentChanged(value: value),                  ),                  const SizedBox(height: 8),                  AppDropdown<TextLeadingDistribution>(                    key: const ValueKey('text-text-leading-distribution'),                    items: TextLeadingDistribution.values                        .map<DropdownMenuItem<TextLeadingDistribution>>(                          (TextLeadingDistribution value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextLeadingDistributionChanged,                    value: cubit.textLeadingDistribution,                    labelText: 'Text Leading Distribution',                  ),                  const SizedBox(height: 16),                ],              ),              Expanded(                child: Padding(                  padding:                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),                  child: SingleChildScrollView(                    child: SelectionArea(                      child: Column(                        mainAxisSize: MainAxisSize.min,                        crossAxisAlignment: CrossAxisAlignment.stretch,                        children: [                          const SizedBox(height: 24),                          MultiValueListenableBuilder(                            builder: (context, values, child) {                              return Text(                                cubit.textController.text,                                maxLines: cubit.maxLineController.text.isEmpty                                    ? null // null is default value so change it to null from 1                                    : int.parse(cubit.maxLineController.text),                                overflow: cubit.overflow,                                textScaler: cubit.textScaler,                                textAlign: cubit.align,                                selectionColor: cubit.selectionColor,                                textWidthBasis: cubit.textWidthBasis,                                softWrap: cubit.softWrap,                                style: TextStyle(                                  fontSize: cubit.fontSize.value,                                  fontWeight: cubit.fontWeight,                                  fontFamily: cubit.fontFamily?.name,                                  color: cubit.fontColor,                                ),                                textHeightBehavior: TextHeightBehavior(                                  applyHeightToFirstAscent:                                      cubit.applyHeightToAscent,                                  applyHeightToLastDescent:                                      cubit.applyHeightToDescent,                                  leadingDistribution:                                      cubit.textLeadingDistribution,                                ),                              );                            },                            valueListenables: [                              cubit.textController,                              cubit.maxLineController,                              cubit.fontSize,                            ],                          ),                        ],                      ),                    ),                  ),                ),              ),            ],          );        },      ),    );  }}