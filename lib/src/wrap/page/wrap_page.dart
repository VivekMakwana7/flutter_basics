import 'package:flutter/material.dart';
import 'package:flutter_basics/src/wrap/cubit/wrap_cubit.dart';
import 'package:flutter_basics/src/wrap/widgets/wrap_output_widget.dart';
import 'package:flutter_basics/src/wrap/widgets/wrap_property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wrap page is for demonstrate the [Wrap] widget
class WrapPage extends StatelessWidget {
  /// Default constructor
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WrapCubit(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WrapPropertyWidget(),
          WrapOutputWidget(),
        ],
      ),
    );
  }
}
