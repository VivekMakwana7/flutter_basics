import 'package:flutter/material.dart';
import 'package:flutter_basics/core/ext/ext_build_context.dart';

/// For All widgets fixed UI
class PropertyWidget extends StatelessWidget {
  /// Default constructor
  const PropertyWidget({required this.children, super.key});

  /// For List of property widget passes
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.appColor.sideBarBgColor.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
