import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_border_radius.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container radius View
class ContainerRadius extends StatelessWidget {
  /// Default constructor
  const ContainerRadius({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return Column(
          children: [
            AppDropdown(
              items: AppBorderRadius.values
                  .map<DropdownMenuItem<AppBorderRadius>>(
                    (AppBorderRadius value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  )
                  .toList(),
              onChanged: cubit.onRadiusChanged,
              value: cubit.radius,
              labelText: 'Radius',
            ),
            const SizedBox(height: 8),
            if (cubit.radius?.isAll ?? false) ...[
              AppSlider(
                valueListenable: cubit.radiusTop,
                onChanged: (value) => cubit.radiusTop.value = value,
                labelText: 'All',
              ),
            ],
            if (cubit.radius?.isCircular ?? false) ...[
              AppSlider(
                valueListenable: cubit.radiusTop,
                onChanged: (value) => cubit.radiusTop.value = value,
                labelText: 'Circular',
              ),
            ],
            if (cubit.radius?.isOnly ?? false) ...[
              AppSlider(
                valueListenable: cubit.radiusLeft,
                onChanged: (value) => cubit.radiusLeft.value = value,
                labelText: 'Left',
              ),
              AppSlider(
                valueListenable: cubit.radiusRight,
                onChanged: (value) => cubit.radiusRight.value = value,
                labelText: 'Right',
              ),
              AppSlider(
                valueListenable: cubit.radiusTop,
                onChanged: (value) => cubit.radiusTop.value = value,
                labelText: 'Top',
              ),
              AppSlider(
                valueListenable: cubit.radiusBottom,
                onChanged: (value) => cubit.radiusBottom.value = value,
                labelText: 'Bottom',
              ),
            ],
            if (cubit.radius?.isHorizontal ?? false) ...[
              AppSlider(
                valueListenable: cubit.radiusLeft,
                onChanged: (value) => cubit.radiusLeft.value = value,
                labelText: 'Left',
              ),
              AppSlider(
                valueListenable: cubit.radiusRight,
                onChanged: (value) => cubit.radiusRight.value = value,
                labelText: 'Right',
              ),
            ],
            if (cubit.radius?.isVertical ?? false) ...[
              AppSlider(
                valueListenable: cubit.radiusTop,
                onChanged: (value) => cubit.radiusTop.value = value,
                labelText: 'Top',
              ),
              AppSlider(
                valueListenable: cubit.radiusBottom,
                onChanged: (value) => cubit.radiusBottom.value = value,
                labelText: 'Bottom',
              ),
            ],
          ],
        );
      },
    );
  }
}
