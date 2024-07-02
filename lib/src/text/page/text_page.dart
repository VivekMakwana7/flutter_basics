import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:flutter_basics/core/widgets/app_color_picker_dialog.dart';import 'package:flutter_basics/core/widgets/app_dropdown.dart';import 'package:flutter_basics/core/widgets/app_switch.dart';import 'package:flutter_basics/core/widgets/app_text_field.dart';import 'package:flutter_basics/src/text/cubit/text_cubit.dart';import 'package:flutter_basics/src/text/enum/app_text_scale.dart';import 'package:flutter_basics/src/widgets/property_widget.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';/// [TextPage] for all text property usagesclass TextPage extends StatelessWidget {  /// Default constructor  const TextPage({super.key});  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => TextCubit(),      child: BlocBuilder<TextCubit, TextState>(        builder: (context, state) {          final cubit = context.read<TextCubit>();          return Row(            crossAxisAlignment: CrossAxisAlignment.stretch,            children: [              PropertyWidget(                children: [                  const SizedBox(height: 24),                  AppTextField(                    key: const ValueKey('text-enter-text'),                    labelText: 'Write text for better output',                    hintText: 'Enter text...',                    controller: cubit.textController,                    maxLines: 5,                  ),                  const SizedBox(height: 16),                  AppTextField(                    key: const ValueKey('text-enter-max-line'),                    labelText: 'Max Line',                    hintText: '1',                    controller: cubit.maxLineController,                    keyboardType: TextInputType.number,                    inputFormatters: [                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),                    ],                  ),                  const SizedBox(height: 16),                  AppDropdown(                    key: const ValueKey('text-text-overflow'),                    items: TextOverflow.values                        .map<DropdownMenuItem<TextOverflow>>(                          (TextOverflow value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onOverflowChanged,                    value: cubit.overflow,                    labelText: 'Text Overflow',                  ),                  const SizedBox(height: 16),                  AppDropdown<AppTextScale>(                    key: const ValueKey('text-text-scale'),                    items: AppTextScale.values                        .map<DropdownMenuItem<AppTextScale>>(                          (AppTextScale value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextScaleChanged,                    value: cubit.scale.value,                    labelText: 'Text Scaler',                  ),                  MultiValueListenableBuilder(                    valueListenables: [                      cubit.scale,                      cubit.textScaleValue,                    ],                    builder: (context, value, child) {                      return cubit.scale.value == AppTextScale.linear                          ? Column(                              mainAxisSize: MainAxisSize.min,                              crossAxisAlignment: CrossAxisAlignment.stretch,                              children: [                                const SizedBox(height: 16),                                Text(                                  '${cubit.textScaleValue.value}',                                  textAlign: TextAlign.right,                                ),                                Slider(                                  value: cubit.textScaleValue.value,                                  onChanged: cubit.onTextScaleValueChanged,                                  max: 10,                                ),                              ],                            )                          : const SizedBox.shrink();                    },                  ),                  const SizedBox(height: 16),                  AppDropdown<TextAlign>(                    key: const ValueKey('text-text-align'),                    items: TextAlign.values                        .map<DropdownMenuItem<TextAlign>>(                          (TextAlign value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextAlignChanged,                    value: cubit.align,                    labelText: 'Text Align',                  ),                  const SizedBox(height: 16),                  AppColorPicker(                    key: const ValueKey('text-selection-color'),                    labelText: 'Selection Color',                    initialColor: cubit.selectionColor,                    onChanged: cubit.onTextSelectionColorChanged,                  ),                  const SizedBox(height: 16),                  AppSwitch(                    key: const ValueKey('text-soft-wrap'),                    labelText: 'Soft Wrap',                    value: cubit.softWrap ?? false,                    onChanged: (value) =>                        cubit.onTextSoftWrapChanged(value: value),                  ),                  const SizedBox(height: 16),                  AppDropdown<TextWidthBasis>(                    key: const ValueKey('text-text-width-basis'),                    items: TextWidthBasis.values                        .map<DropdownMenuItem<TextWidthBasis>>(                          (TextWidthBasis value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextWidthBasisChanged,                    value: cubit.textWidthBasis,                    labelText: 'Text Width Basis',                  ),                  const SizedBox(height: 8),                  const Divider(),                  const SizedBox(height: 8),                  const Text(                    'Text Height Behavior',                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),                  ),                  const SizedBox(height: 8),                  AppSwitch(                    key: const ValueKey('text-apply-height-to-ascent'),                    labelText: 'Apply Height To Ascent',                    value: cubit.applyHeightToAscent,                    onChanged: (value) =>                        cubit.onTextApplyHeightToAscentChanged(value: value),                  ),                  const SizedBox(height: 8),                  AppSwitch(                    key: const ValueKey('text-apply-height-to-descent'),                    labelText: 'Apply Height To Descent',                    value: cubit.applyHeightToDescent,                    onChanged: (value) =>                        cubit.onTextApplyHeightToDescentChanged(value: value),                  ),                  const SizedBox(height: 8),                  AppDropdown<TextLeadingDistribution>(                    key: const ValueKey('text-text-leading-distribution'),                    items: TextLeadingDistribution.values                        .map<DropdownMenuItem<TextLeadingDistribution>>(                          (TextLeadingDistribution value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextLeadingDistributionChanged,                    value: cubit.textLeadingDistribution,                    labelText: 'Text Leading Distribution',                  ),                  const SizedBox(height: 16),                ],              ),              Expanded(                child: Padding(                  padding:                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),                  child: SingleChildScrollView(                    child: SelectionArea(                      child: Column(                        mainAxisSize: MainAxisSize.min,                        crossAxisAlignment: CrossAxisAlignment.stretch,                        children: [                          const SizedBox(height: 24),                          MultiValueListenableBuilder(                            builder: (context, values, child) {                              return Text(                                cubit.textController.text,                                maxLines: cubit.maxLineController.text.isEmpty                                    ? null // null is default value so change it to null from 1                                    : int.parse(cubit.maxLineController.text),                                overflow: cubit.overflow,                                textScaler: cubit.textScaler,                                textAlign: cubit.align,                                selectionColor: cubit.selectionColor,                                textWidthBasis: cubit.textWidthBasis,                                softWrap: cubit.softWrap,                                textHeightBehavior: TextHeightBehavior(                                  applyHeightToFirstAscent:                                      cubit.applyHeightToAscent,                                  applyHeightToLastDescent:                                      cubit.applyHeightToDescent,                                  leadingDistribution:                                      cubit.textLeadingDistribution,                                ),                              );                            },                            valueListenables: [                              cubit.textController,                              cubit.maxLineController,                            ],                          ),                        ],                      ),                    ),                  ),                ),              ),            ],          );        },      ),    );  }}