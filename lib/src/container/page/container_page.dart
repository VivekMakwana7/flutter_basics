import 'package:flutter/material.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_basics/src/container/widgets/container_output_widget.dart';
import 'package:flutter_basics/src/container/widgets/container_property_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ContainerPage] is for demonstration the container property
class ContainerPage extends StatelessWidget {
  /// Default constructor
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerCubit(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContainerPropertyWidget(),
          ContainerOutputWidget(),
        ],
      ),
    );
  }
}
