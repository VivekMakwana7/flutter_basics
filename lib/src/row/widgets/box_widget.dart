import 'dart:math';import 'package:flutter/material.dart';/// Box Widget for Column/Row Demonstrateclass BoxWidget extends StatelessWidget {  /// Default constructor  const BoxWidget({super.key});  @override  Widget build(BuildContext context) {    /// Random Color generator    final color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));    return ColoredBox(      color: color,      child: const SizedBox.square(dimension: 50),    );  }}