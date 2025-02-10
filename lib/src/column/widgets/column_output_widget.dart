import 'package:flutter/material.dart';
import 'package:flutter_basics/src/column/cubit/column_cubit.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColumnOutputWidget extends StatelessWidget {
  const ColumnOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColumnCubit, ColumnState>(
      builder: (context, state) {
        final cubit = context.read<ColumnCubit>();
        return Expanded(
          child: Column(
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
        );
      },
    );
  }
}
