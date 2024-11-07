import 'package:flutter/material.dart';
import 'package:sneakers_app/core/helpers/constants.dart';
import 'package:sneakers_app/ui/styles/colors.dart';

BoxDecoration cardDecoration({
  Color? color,
  BorderRadius? borderRadius,
  bool withShadow = false,
}) =>
    BoxDecoration(
      color: color ?? AppColors.shapeBackground,
      boxShadow: withShadow
          ? [
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                  color: AppColors.black.withOpacity(0.1))
            ]
          : null,
      borderRadius: borderRadius ??
          BorderRadius.circular(
            horizontalSpacing,
          ),
    );
BoxDecoration circleDecoration({Color? color}) => BoxDecoration(
      color: color ?? AppColors.shapeBackground,
      shape: BoxShape.circle,
    );

SizedBox generalBox = SizedBox(
  height: verticalSpacing,
  width: horizontalSpacing,
);

SizedBox generalSmallBox = SizedBox(
  height: verticalSpacing / 2,
  width: horizontalSpacing / 2,
);
