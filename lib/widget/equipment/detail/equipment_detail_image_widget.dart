import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';

class EquipmentDetailImageWidget extends ConsumerWidget {
  const EquipmentDetailImageWidget({
    super.key,
    required this.imageUrl,
    this.grade,
  });

  final String imageUrl;
  final String? grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: grade != null
              ? Border.all(
                  width: 3,
                  color: StaticSwitchConfig.potentialGradeDetailColor[grade]!,
                )
              : null,
          borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          boxShadow: grade != null
              ? [
                  BoxShadow(
                    blurRadius: RadiusConfig.littleRadius,
                    color: StaticSwitchConfig.potentialGradeDetailColor[grade]!,
                    blurStyle: BlurStyle.outer,
                  ),
                ]
              : null,
        ),
        child: Container(
            padding: EdgeInsets.all(DimenConfig.minDimen),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ItemColor.detailItemStartBackground,
                    ItemColor.detailItemEndBackground
                  ],
                  tileMode: TileMode.mirror),
              border: Border.all(width: 1, color: ItemColor.background),
              borderRadius: BorderRadius.circular(RadiusConfig.subRadius - 3),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    semanticLabel: '아이템 이미지',
                  ),
                ),
                Transform.rotate(
                    angle: pi / 4,
                    child: Transform.translate(
                        offset: Offset(-82.5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Color.fromRGBO(255, 255, 255, 0.75),
                                Color.fromRGBO(255, 255, 255, 0),
                              ])),
                        ))),
              ],
            )),
      ),
    );
  }
}
