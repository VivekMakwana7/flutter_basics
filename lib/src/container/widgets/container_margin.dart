import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_padding.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/core/widgets/app_slider.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container margin View
class ContainerMargin extends StatelessWidget {
  /// Default constructor
  const ContainerMargin({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return Column(
          children: [
            AppDropdown(
              items: AppPadding.values
                  .map<DropdownMenuItem<AppPadding>>(
                    (AppPadding value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  )
                  .toList(),
              onChanged: cubit.onMarginChanged,
              value: cubit.margin,
              labelText: 'Margin',
            ),
            const SizedBox(height: 8),
            if (cubit.margin?.isAll ?? false) ...[
              AppSlider(
                valueListenable: cubit.marginTop,
                onChanged: (value) => cubit.marginTop.value = value,
                labelText: 'All',
              ),
            ],
            if (cubit.margin?.isOnly ?? false) ...[
              AppSlider(
                valueListenable: cubit.marginLeft,
                onChanged: (value) => cubit.marginLeft.value = value,
                labelText: 'Left',
              ),
              AppSlider(
                valueListenable: cubit.marginRight,
                onChanged: (value) => cubit.marginRight.value = value,
                labelText: 'Right',
              ),
              AppSlider(
                valueListenable: cubit.marginTop,
                onChanged: (value) => cubit.marginTop.value = value,
                labelText: 'Top',
              ),
              AppSlider(
                valueListenable: cubit.marginBottom,
                onChanged: (value) => cubit.marginBottom.value = value,
                labelText: 'Bottom',
              ),
            ],
            if (cubit.margin?.isSymmetric ?? false) ...[
              AppSlider(
                valueListenable: cubit.marginLeft,
                onChanged: (value) => cubit.marginLeft.value = value,
                labelText: 'Horizontal',
              ),
              AppSlider(
                valueListenable: cubit.marginTop,
                onChanged: (value) => cubit.marginTop.value = value,
                labelText: 'Vertical',
              ),
            ],
          ],
        );
      },
    );
  }
}
