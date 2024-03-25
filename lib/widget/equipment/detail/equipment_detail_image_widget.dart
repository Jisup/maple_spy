import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';

class EquipmentDetailImageWidget extends ConsumerWidget {
  const EquipmentDetailImageWidget({
    super.key,
    required this.imageUrl,
    this.grade,
    this.label,
    this.petLabel,
  });

  final String imageUrl;
  final String? grade;
  final String? label;
  final String? petLabel;

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
                  BoxShadow(
                    blurRadius: RadiusConfig.minRadius,
                    color: Colors.black,
                    blurStyle: BlurStyle.outer,
                  ),
                ]
              : null,
        ),
        child: Container(
          padding: EdgeInsets.all(DimenConfig.minDimen),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  EquipmentColor.detailItemStartBackground,
                  EquipmentColor.detailItemEndBackground
                ],
                tileMode: TileMode.mirror),
            border: Border.all(width: 1, color: EquipmentColor.background),
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
                      offset:
                          Offset(-MediaQuery.of(context).size.width / 4.75, 0),
                      child: Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color.fromRGBO(255, 255, 255, 0.75),
                              Color.fromRGBO(255, 255, 255, 0),
                            ])),
                      ))),
              label != null
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      width: 45,
                      height: 45,
                      child: Container(
                        margin: EdgeInsets.all(DimenConfig.subDimen),
                        child: Container(
                          margin: EdgeInsets.all(DimenConfig.minDimen),
                          decoration: customBoxDecoration(
                            type: label != '캐시'
                                ? 'label_in_out_circle'
                                : 'label_no',
                            startColor: StaticSwitchConfig
                                .labelStartBackgroundColor[label]!,
                            endColor: StaticSwitchConfig
                                .labelEndBackgroundColor[label]!,
                            borderColor:
                                StaticSwitchConfig.labelBorderColor[label]!,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            StaticSwitchConfig.labelInitialText[label]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: StaticSwitchConfig
                                    .labelInitialColor[label]!,
                                fontSize: FontConfig.middleDownSize - 1,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'MapleStory',
                                shadows: [
                                  Shadow(
                                    color: StaticSwitchConfig
                                        .labelInitialShadowColor[label]!,
                                    offset: const Offset(-1, 0),
                                  ),
                                  Shadow(
                                    color: StaticSwitchConfig
                                        .labelInitialShadowColor[label]!,
                                    offset: const Offset(1, 0),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              petLabel != null
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      width: 45,
                      height: 45,
                      child: petLabel != '캐시'
                          ? Container(
                              margin: EdgeInsets.all(DimenConfig.subDimen),
                              child: Container(
                                margin: EdgeInsets.all(DimenConfig.minDimen),
                                decoration: customBoxDecoration(
                                  type: 'pet_out_circle',
                                  borderColor: StaticSwitchConfig
                                      .petLabelBorderColor[petLabel]!,
                                ),
                                child: ClipOval(
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              gradient: RadialGradient(
                                                  radius: 0.625,
                                                  colors: [
                                                Colors.white,
                                                PetColor.lunaStartBorder,
                                                PetColor.lunaMiddleBorder,
                                                PetColor.lunaEndBorder,
                                              ])),
                                          child: Transform.translate(
                                            offset: Offset(-5, -5),
                                            child: Container(
                                              decoration: customBoxDecoration(
                                                type:
                                                    'pet_linear_impact_circle',
                                                startColor: StaticSwitchConfig
                                                        .petLabelStartBackgroundColor[
                                                    petLabel]!,
                                                endColor: StaticSwitchConfig
                                                        .petLabelEndBackgroundColor[
                                                    petLabel]!,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          StaticSwitchConfig
                                              .petLabelInitialText[petLabel]!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: StaticSwitchConfig
                                                    .petLabelInitialColor[
                                                petLabel]!,
                                            fontSize:
                                                FontConfig.middleDownSize - 1,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'MapleStory',
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(DimenConfig.subDimen),
                              child: Container(
                                margin: EdgeInsets.all(DimenConfig.minDimen),
                                decoration: customBoxDecoration(
                                  type: 'label_no',
                                  startColor: StaticSwitchConfig
                                      .petLabelStartBackgroundColor[petLabel]!,
                                  endColor: StaticSwitchConfig
                                      .petLabelEndBackgroundColor[petLabel]!,
                                  borderColor: StaticSwitchConfig
                                      .petLabelBorderColor[petLabel]!,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  StaticSwitchConfig
                                      .petLabelInitialText[petLabel]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: StaticSwitchConfig
                                        .petLabelInitialColor[petLabel]!,
                                    fontSize: FontConfig.middleDownSize - 1,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'MapleStory',
                                  ),
                                ),
                              ),
                            ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
