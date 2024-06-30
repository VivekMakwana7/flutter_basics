import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:flutter_basics/core/widgets/app_dropdown.dart';import 'package:flutter_basics/core/widgets/app_text_field.dart';import 'package:flutter_basics/src/text/cubit/text_cubit.dart';import 'package:flutter_basics/src/text/text_scale.dart';import 'package:flutter_basics/src/widgets/property_widget.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';/// [TextPage] for all text property usagesclass TextPage extends StatelessWidget {  /// Default constructor  const TextPage({super.key});  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => TextCubit(),      child: BlocBuilder<TextCubit, TextState>(        builder: (context, state) {          final cubit = context.read<TextCubit>();          return Row(            crossAxisAlignment: CrossAxisAlignment.stretch,            children: [              PropertyWidget(                children: [                  const SizedBox(height: 24),                  AppTextField(                    key: const ValueKey('text-enter-text'),                    labelText: 'Write text for better output',                    hintText: 'Enter text...',                    controller: cubit.textController,                    maxLines: 5,                  ),                  const SizedBox(height: 16),                  AppTextField(                    key: const ValueKey('text-enter-max-line'),                    labelText: 'Max Line',                    hintText: '1',                    controller: cubit.maxLineController,                    keyboardType: TextInputType.number,                    inputFormatters: [                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),                    ],                  ),                  const SizedBox(height: 16),                  AppDropdown(                    key: const ValueKey('text-text-overflow'),                    items: TextOverflow.values                        .map<DropdownMenuItem<TextOverflow>>(                          (TextOverflow value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onOverflowChanged,                    value: cubit.overflow,                    labelText: 'Text Overflow',                  ),                  const SizedBox(height: 16),                  AppDropdown<TextScale>(                    key: const ValueKey('text-text-scale'),                    items: TextScale.values                        .map<DropdownMenuItem<TextScale>>(                          (TextScale value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextScaleChanged,                    value: cubit.scale.value,                    labelText: 'Text Scaler',                  ),                  MultiValueListenableBuilder(                    valueListenables: [                      cubit.scale,                      cubit.textScaleValue,                    ],                    builder: (context, value, child) {                      return cubit.scale.value == TextScale.linear                          ? Column(                              mainAxisSize: MainAxisSize.min,                              crossAxisAlignment: CrossAxisAlignment.stretch,                              children: [                                const SizedBox(height: 16),                                Text(                                  '${cubit.textScaleValue.value}',                                  textAlign: TextAlign.right,                                ),                                Slider(                                  value: cubit.textScaleValue.value,                                  onChanged: cubit.onTextScaleValueChanged,                                  max: 10,                                ),                              ],                            )                          : const SizedBox.shrink();                    },                  ),                  const SizedBox(height: 16),                  AppDropdown<TextAlign>(                    key: const ValueKey('text-text-align'),                    items: TextAlign.values                        .map<DropdownMenuItem<TextAlign>>(                          (TextAlign value) => DropdownMenuItem(                            value: value,                            child: Text(value.name),                          ),                        )                        .toList(),                    onChanged: cubit.onTextAlignChanged,                    value: cubit.align,                    labelText: 'Text Align',                  ),                ],              ),              Expanded(                child: Padding(                  padding:                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),                  child: SingleChildScrollView(                    child: Column(                      mainAxisSize: MainAxisSize.min,                      crossAxisAlignment: CrossAxisAlignment.stretch,                      children: [                        const SizedBox(height: 24),                        MultiValueListenableBuilder(                          builder: (context, values, child) {                            return Text(                              cubit.textController.text,                              maxLines: cubit.maxLineController.text.isEmpty                                  ? null // null is default value so change it to null from 1                                  : int.parse(cubit.maxLineController.text),                              overflow: cubit.overflow,                              textScaler: cubit.textScaler,                              textAlign: cubit.align,                            );                          },                          valueListenables: [                            cubit.textController,                            cubit.maxLineController,                          ],                        ),                      ],                    ),                  ),                ),              ),            ],          );        },      ),    );  }}