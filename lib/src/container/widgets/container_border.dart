import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_border.dart';
import 'package:flutter_basics/core/widgets/app_divider.dart';
import 'package:flutter_basics/core/widgets/app_dropdown.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_basics/src/container/widgets/container_border_side.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container Border View
class ContainerBorder extends StatelessWidget {
  /// Default constructor
  const ContainerBorder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContainerCubit>();
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        return Column(
          children: [
            AppDropdown(
              items: AppBorder.values
                  .map<DropdownMenuItem<AppBorder>>(
                    (AppBorder value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    ),
                  )
                  .toList(),
              onChanged: cubit.onBorderChanged,
              value: cubit.appBorder,
              labelText: 'Border',
            ),
            if (cubit.appBorder.isSebt) ...[
              const AppDivider(height: 8),
              ContainerBorderSide(
                title: 'Top Border Side',
                borderColor: cubit.topBorderColor,
                borderWidth: cubit.topBorderWidth,
                borderStyle: cubit.topBorderStyle,
                borderStokeAlign: cubit.topBorderStrokeAlign,
                onBorderStyleChanged: cubit.onTopBorderStyleChanged,
                onColorChanged: cubit.onTopBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.topBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.topBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
              const AppDivider(height: 6),
              ContainerBorderSide(
                title: 'Bottom Border Side',
                borderColor: cubit.bottomBorderColor,
                borderWidth: cubit.bottomBorderWidth,
                borderStyle: cubit.bottomBorderStyle,
                borderStokeAlign: cubit.bottomBorderStrokeAlign,
                onBorderStyleChanged: cubit.onBottomBorderStyleChanged,
                onColorChanged: cubit.onBottomBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.bottomBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.bottomBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
              const AppDivider(height: 6),
              ContainerBorderSide(
                title: 'Left Border Side',
                borderColor: cubit.leftBorderColor,
                borderWidth: cubit.leftBorderWidth,
                borderStyle: cubit.leftBorderStyle,
                borderStokeAlign: cubit.leftBorderStrokeAlign,
                onBorderStyleChanged: cubit.onLeftBorderStyleChanged,
                onColorChanged: cubit.onLeftBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.leftBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.leftBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
              const AppDivider(height: 6),
              ContainerBorderSide(
                title: 'Right Border Side',
                borderColor: cubit.rightBorderColor,
                borderWidth: cubit.rightBorderWidth,
                borderStyle: cubit.rightBorderStyle,
                borderStokeAlign: cubit.rightBorderStrokeAlign,
                onBorderStyleChanged: cubit.onRightBorderStyleChanged,
                onColorChanged: cubit.onRightBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.rightBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.rightBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
            ],
            if (cubit.appBorder.isSymmetric) ...[
              const AppDivider(height: 8),
              ContainerBorderSide(
                title: 'Vertical Border Side',
                borderColor: cubit.topBorderColor,
                borderWidth: cubit.topBorderWidth,
                borderStyle: cubit.topBorderStyle,
                borderStokeAlign: cubit.topBorderStrokeAlign,
                onBorderStyleChanged: cubit.onTopBorderStyleChanged,
                onColorChanged: cubit.onTopBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.topBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.topBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
              const AppDivider(height: 6),
              ContainerBorderSide(
                title: 'Horizontal Border Side',
                borderColor: cubit.leftBorderColor,
                borderWidth: cubit.leftBorderWidth,
                borderStyle: cubit.leftBorderStyle,
                borderStokeAlign: cubit.leftBorderStrokeAlign,
                onBorderStyleChanged: cubit.onLeftBorderStyleChanged,
                onColorChanged: cubit.onLeftBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.leftBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.leftBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
            ],
            if (cubit.appBorder.isAll || cubit.appBorder.isFromSide) ...[
              const AppDivider(height: 8),
              ContainerBorderSide(
                title: 'All Border Side',
                borderColor: cubit.topBorderColor,
                borderWidth: cubit.topBorderWidth,
                borderStyle: cubit.topBorderStyle,
                borderStokeAlign: cubit.topBorderStrokeAlign,
                onBorderStyleChanged: cubit.onTopBorderStyleChanged,
                onColorChanged: cubit.onTopBorderColorChanged,
                onBorderWidthChanged: (value) => cubit.topBorderWidth.value = value,
                onBorderStrokeAlignChanged: (value) => cubit.topBorderStrokeAlign.value = value,
                max: cubit.height.value / 3,
              ),
            ],
          ],
        );
      },
    );
  }
}
