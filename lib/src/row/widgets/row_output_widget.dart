import 'package:flutter/material.dart';
import 'package:flutter_basics/src/row/cubit/row_cubit.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [RowOutputWidget] for Row's output
class RowOutputWidget extends StatelessWidget {
  /// Default constructor
  const RowOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RowCubit, RowState>(
      builder: (context, state) {
        final cubit = context.read<RowCubit>();
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: cubit.mainAxisSize,
              mainAxisAlignment: cubit.mainAxisAlignment,
              crossAxisAlignment: cubit.crossAxisAlignment,
              textBaseline: cubit.textBaseline,
              textDirection: cubit.textDirection,
              verticalDirection: cubit.verticalDirection,
              children: [
                for (int index = 0; index < cubit.boxes; index++) ...[
                  const BoxWidget(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
