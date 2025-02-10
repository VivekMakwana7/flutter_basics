import 'package:flutter/material.dart';
import 'package:flutter_basics/core/enum/app_alignment.dart';
import 'package:flutter_basics/src/container/cubit/cubit/container_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// [ContainerOutputWidget] is for demonstration the container property
class ContainerOutputWidget extends StatelessWidget {
  /// Default constructor
  const ContainerOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContainerCubit, ContainerState>(
      builder: (context, state) {
        final cubit = context.read<ContainerCubit>();
        return Expanded(
          child: Center(
            child: MultiValueListenableBuilder(
              valueListenables: [
                cubit.height,
                cubit.width,
                cubit.paddingTop,
                cubit.paddingBottom,
                cubit.paddingLeft,
                cubit.paddingRight,
                cubit.marginTop,
                cubit.marginBottom,
                cubit.marginLeft,
                cubit.marginRight,
                cubit.radiusTop,
                cubit.radiusBottom,
                cubit.radiusLeft,
                cubit.radiusRight,
                cubit.gradientColors,
                cubit.gradientRadius,
                cubit.focalRadius,
                cubit.startAngle,
                cubit.endAngle,
                cubit.gradientRadians,
                cubit.borderStrokeAlign,
                cubit.topBorderWidth,
                cubit.topBorderStrokeAlign,
                cubit.bottomBorderWidth,
                cubit.bottomBorderStrokeAlign,
                cubit.leftBorderWidth,
                cubit.leftBorderStrokeAlign,
                cubit.rightBorderWidth,
                cubit.rightBorderStrokeAlign,
                ...cubit.boxShadows.map((e) => e.dx),
                ...cubit.boxShadows.map((e) => e.dy),
                ...cubit.boxShadows.map((e) => e.spreadRadius),
                ...cubit.boxShadows.map((e) => e.blurRadius),
                cubit.scale,
                cubit.opacity,
              ],
              builder: (context, _, __) {
                return Container(
                  height: cubit.height.value,
                  width: cubit.width.value,
                  alignment: cubit.alignment?.alignment,
                  padding: cubit.paddingValue,
                  margin: cubit.marginValue,
                  decoration: BoxDecoration(
                    color: cubit.color,
                    borderRadius: cubit.radiusValue,
                    backgroundBlendMode: cubit.blendMode,
                    shape: cubit.boxShape,
                    gradient: cubit.gradientValue,
                    border: cubit.borderValue,
                    boxShadow: cubit.boxShadowValue,
                    image: cubit.isImagePreview
                        ? DecorationImage(
                            image: const AssetImage('assets/images/image.jpeg'),
                            fit: cubit.imageFit,
                            alignment: cubit.imageAlignment.alignment,
                            matchTextDirection: cubit.matchTextDirection,
                            repeat: cubit.repeat,
                            filterQuality: cubit.filterQuality,
                            invertColors: cubit.invertColors,
                            isAntiAlias: cubit.isAntiAlias,
                            scale: cubit.scale.value,
                            opacity: cubit.opacity.value,
                            colorFilter: cubit.colorFilter,
                          )
                        : null,
                  ),
                  child: const Text('Box'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
