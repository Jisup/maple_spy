import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';

/*
 * no
 *      → 어떠한 gradient도 지정하지 않음
 * 
 * in_out_square: RadialGradient
 *      → 색상 두가지를 중앙에서부터 색을 뿌림. 단, inset효과가 적용됨
 *      → square형태에 적합함.
 * 
 * in_out_bar: RadialGradient
 *      → 색상 두가지를 중앙에서부터 색을 뿌림.
 *      → bar형태에 적합함
 * 
 * three_divide: SweepGradient
 *      → 색상 두가지를 교차하여 0도/120도/240도를 기반으로 색을 뿌림
 * 
 */

BoxDecoration? customBoxDecoration({
  required String type,
  Color? startColor,
  Color? endColor,
  Color? borderColor,
}) {
  Color mainColor = SkillColor.background;

  return switch (type) {
    'no' => BoxDecoration(
          color: startColor ?? mainColor,
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          boxShadow: [
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: Offset(-3, -3),
                color: Colors.white70,
                inset: true),
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: Offset(3, 3),
                color: Colors.black87,
                inset: true)
          ]),
    'in_out_square' => BoxDecoration(
          gradient: RadialGradient(
            transform: GradientRotation(pi + pi / 2),
            radius: 0.5,
            colors: [
              startColor ?? mainColor,
              endColor ?? mainColor,
            ],
          ),
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          boxShadow: [
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: Offset(-3, -3),
                color: Colors.white70,
                inset: true),
            BoxShadow(
                blurRadius: RadiusConfig.subRadius,
                offset: Offset(3, 3),
                color: Colors.black87,
                inset: true)
          ]),
    'in_out_bar' => BoxDecoration(
        gradient: RadialGradient(
          transform: GradientRotation(pi + pi / 2),
          radius: RadiusConfig.minRadius,
          colors: [
            startColor ?? mainColor,
            endColor ?? mainColor,
          ],
        ),
        border: Border.all(
          color: borderColor ?? mainColor,
          width: StrokeConfig.commonWidth,
        ),
        borderRadius: BorderRadius.circular(RadiusConfig.maxRadius),
      ),
    'three_divide' => BoxDecoration(
        gradient: SweepGradient(
          transform: GradientRotation(pi + pi / 2),
          colors: [
            startColor ?? mainColor,
            endColor ?? mainColor,
            startColor ?? mainColor,
            endColor ?? mainColor,
            startColor ?? mainColor,
            endColor ?? mainColor,
          ],
          stops: StaticListConfig.threeDivideBackgroundList,
        ),
        border: Border.all(
          color: borderColor ?? mainColor,
        ),
        borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
        boxShadow: [
          BoxShadow(
              blurRadius: RadiusConfig.subRadius,
              offset: Offset(-3, -3),
              color: Colors.white70,
              inset: true),
          BoxShadow(
              blurRadius: RadiusConfig.subRadius,
              offset: Offset(3, 3),
              color: Colors.black87,
              inset: true)
        ],
      ),
    _ => null,
  };
}
