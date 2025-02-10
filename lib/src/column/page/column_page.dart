import 'package:flutter/material.dart';
import 'package:flutter_basics/src/column/cubit/column_cubit.dart';
import 'package:flutter_basics/src/column/widgets/column_output_widget.dart';
import 'package:flutter_basics/src/column/widgets/column_property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Column] property Page
class ColumnPage extends StatelessWidget {
  /// Default constructor
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColumnCubit(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColumnPropertyWidget(),
          ColumnOutputWidget(),
        ],
      ),
    );
  }
}
