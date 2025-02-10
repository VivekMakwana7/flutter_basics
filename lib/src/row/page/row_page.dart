import 'package:flutter/material.dart';
import 'package:flutter_basics/src/row/cubit/row_cubit.dart';
import 'package:flutter_basics/src/row/widgets/row_output_widget.dart';
import 'package:flutter_basics/src/row/widgets/row_property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [RowPage] for Row's property demo
class RowPage extends StatelessWidget {
  /// Default constructor
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RowCubit(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RowPropertyWidget(),
          RowOutputWidget(),
        ],
      ),
    );
  }
}
