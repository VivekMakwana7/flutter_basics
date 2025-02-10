import 'package:flutter/material.dart';
import 'package:flutter_basics/src/text/cubit/text_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

/// [TextOutputWidget] for all text property output
class TextOutputWidget extends StatelessWidget {
  /// Default constructor
  const TextOutputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TextCubit>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: SelectionArea(
            child: BlocBuilder<TextCubit, TextState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MultiValueListenableBuilder(
                      valueListenables: [
                        cubit.textController,
                        cubit.maxLineController,
                        cubit.fontSize,
                        cubit.decorationThickness,
                        cubit.height,
                        cubit.wordSpacing,
                        cubit.letterSpacing,
                      ],
                      builder: (context, values, child) {
                        return Text(
                          cubit.textController.text,
                          maxLines: cubit.maxLineController.text.isEmpty
                              ? null // null is default value so change it to null from 1
                              : int.parse(cubit.maxLineController.text),
                          overflow: cubit.overflow,
                          textScaler: cubit.textScaler,
                          textAlign: cubit.align,
                          selectionColor: cubit.selectionColor,
                          textWidthBasis: cubit.textWidthBasis,
                          softWrap: cubit.softWrap,
                          style: TextStyle(
                            fontSize: cubit.fontSize.value,
                            fontWeight: cubit.fontWeight,
                            fontFamily: cubit.fontFamily?.name,
                            color: cubit.fontColor,
                            backgroundColor: cubit.fontBackgroundColor,
                            fontStyle: cubit.fontStyle,
                            decoration: cubit.textDecoration,
                            decorationColor: cubit.decorationColor,
                            decorationStyle: cubit.textDecorationStyle,
                            decorationThickness: cubit.decorationThickness.value,
                            height: cubit.height.value,
                            wordSpacing: cubit.wordSpacing.value,
                            letterSpacing: cubit.letterSpacing.value,
                            inherit: cubit.inherit ?? true,
                            textBaseline: cubit.textBaseline,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: cubit.applyHeightToAscent,
                            applyHeightToLastDescent: cubit.applyHeightToDescent,
                            leadingDistribution: cubit.textLeadingDistribution,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
