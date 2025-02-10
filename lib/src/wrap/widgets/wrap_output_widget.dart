import 'package:flutter/material.dart';
import 'package:flutter_basics/src/row/widgets/box_widget.dart';
import 'package:flutter_basics/src/wrap/cubit/wrap_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// Wrap Output Widget
class WrapOutputWidget extends StatelessWidget {
  /// Default constructor
  const WrapOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapCubit, WrapState>(
      builder: (context, state) {
        final cubit = context.read<WrapCubit>();
        return Expanded(
          child: MultiValueListenableBuilder(
            valueListenables: [
              cubit.spacing,
              cubit.runSpacing,
            ],
            builder: (BuildContext context, _, Widget? child) => Wrap(
              crossAxisAlignment: cubit.crossAxisAlignment,
              verticalDirection: cubit.verticalDirection,
              alignment: cubit.alignment,
              direction: cubit.direction,
              runAlignment: cubit.runAlignment,
              textDirection: cubit.textDirection,
              spacing: cubit.spacing.value,
              runSpacing: cubit.runSpacing.value,
              clipBehavior: cubit.clipBehavior,
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
