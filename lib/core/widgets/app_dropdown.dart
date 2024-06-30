import 'package:flutter/material.dart';import 'package:flutter_basics/core/ext/ext_build_context.dart';/// App Drop downclass AppDropdown<T> extends StatelessWidget {  /// Default constructor  const AppDropdown({    required this.items,    required this.labelText,    this.onChanged,    this.value,    super.key,  });  /// Dropdown menu item for Listing  final List<DropdownMenuItem<T>> items;  /// On changed value  final void Function(T? value)? onChanged;  /// Selected value  final T? value;  /// Title text  final String labelText;  @override  Widget build(BuildContext context) {    return Column(      mainAxisSize: MainAxisSize.min,      crossAxisAlignment: CrossAxisAlignment.start,      children: [        Text(          labelText,          style:              context.text.titleMedium?.copyWith(fontWeight: FontWeight.w500),        ),        const SizedBox(height: 8),        Container(          padding: const EdgeInsets.symmetric(horizontal: 8),          decoration: BoxDecoration(            borderRadius: BorderRadius.circular(4),            border: Border.all(              color: const Color(0xff505063),            ),          ),          child: DropdownButton<T>(            onChanged: onChanged,            items: items,            underline: const SizedBox.shrink(),            padding: EdgeInsets.zero,            isExpanded: true,            value: value,          ),        ),      ],    );  }}