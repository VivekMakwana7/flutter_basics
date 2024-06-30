import 'package:flutter/material.dart';import 'package:flutter_basics/core/ext/ext_build_context.dart';import 'package:flutter_colorpicker/flutter_colorpicker.dart';/// Dialog for Color pickerFuture<Color> _showAppColorPickerDialog(  BuildContext context, {  required Color initialColor,}) async {  await showDialog<Color>(    context: context,    builder: (context) => AlertDialog(      title: const Text('Pick a color!'),      content: SingleChildScrollView(        child: StatefulBuilder(          builder: (context, setState) {            return ColorPicker(              pickerColor: initialColor,              onColorChanged: (value) {                initialColor = value;                setState(() {});              },            );          },        ),      ),      actions: <Widget>[        ElevatedButton(          child: const Text('Change'),          onPressed: () {            Navigator.of(context).pop(initialColor);          },        ),      ],    ),  );  return initialColor;}/// App Color Pickerclass AppColorPicker extends StatelessWidget {  /// Default constructor  const AppColorPicker({    required this.labelText,    required this.initialColor,    this.onChanged,    super.key,  });  /// Title String for display  final String labelText;  /// Initial Selected color  final Color initialColor;  /// Void callback after the color selected  final void Function(Color color)? onChanged;  @override  Widget build(BuildContext context) {    return GestureDetector(        onTap: () {          _showAppColorPickerDialog(context, initialColor: initialColor).then(            (value) {              onChanged?.call(value);            },          );        },        behavior: HitTestBehavior.opaque,        child: Row(          children: [            SizedBox(              width: 40,              height: 40,              child: DecoratedBox(                decoration: BoxDecoration(                  color: initialColor,                  borderRadius: BorderRadius.circular(8),                ),              ),            ),            const SizedBox(width: 12),            Text(              labelText,              style: context.text.titleMedium                  ?.copyWith(fontWeight: FontWeight.w500),            )          ],        ));  }}