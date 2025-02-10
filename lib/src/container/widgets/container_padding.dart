import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container Padding View
class ContainerPadding extends StatelessWidget {
  /// Default constructor
  const ContainerPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return Column(
          children: [
            AppDropdown(
              key: const ValueKey('container-padding'),
              items: AppPadding.values
                  .map<DropdownMenuItem<AppPadding>>(
                    (AppPadding value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  )
                  .toList(),
              onChanged: cubit.onPaddingChanged,
              value: cubit.padding,
              labelText: 'Padding',
            ),
            const SizedBox(height: 8),
            if (cubit.padding?.isAll ?? false) ...[
              AppSlider(
                key: const ValueKey('container-padding-all'),
                valueListenable: cubit.paddingTop,
                onChanged: (value) => cubit.paddingTop.value = value,
                labelText: 'All',
              ),
            ],
            if (cubit.padding?.isOnly ?? false) ...[
              AppSlider(
                key: const ValueKey('container-padding-left'),
                valueListenable: cubit.paddingLeft,
                onChanged: (value) => cubit.paddingLeft.value = value,
                labelText: 'Left',
              ),
              AppSlider(
                key: const ValueKey('container-padding-right'),
                valueListenable: cubit.paddingRight,
                onChanged: (value) => cubit.paddingRight.value = value,
                labelText: 'Right',
              ),
              AppSlider(
                key: const ValueKey('container-padding-top'),
                valueListenable: cubit.paddingTop,
                onChanged: (value) => cubit.paddingTop.value = value,
                labelText: 'Top',
              ),
              AppSlider(
                key: const ValueKey('container-padding-bottom'),
                valueListenable: cubit.paddingBottom,
                onChanged: (value) => cubit.paddingBottom.value = value,
                labelText: 'Bottom',
              ),
            ],
            if (cubit.padding?.isSymmetric ?? false) ...[
              AppSlider(
                key: const ValueKey('container-padding-horizontal'),
                valueListenable: cubit.paddingLeft,
                onChanged: (value) => cubit.paddingLeft.value = value,
                labelText: 'Horizontal',
              ),
              AppSlider(
                key: const ValueKey('container-padding-vertical'),
                valueListenable: cubit.paddingTop,
                onChanged: (value) => cubit.paddingTop.value = value,
                labelText: 'Vertical',
              ),
            ],
          ],
        );
      },
    );
  }
}
