import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';

class PotentialGradeIconWidget extends ConsumerWidget {
  const PotentialGradeIconWidget({super.key, required this.potentialGrade});

  final String potentialGrade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(right: DimenConfig.subDimen),
      decoration: BoxDecoration(
        color: StaticSwitchConfig.potentialGradeColor[potentialGrade]!,
        border: Border.all(
            color: StaticSwitchConfig
                .potentialGradeIconBorderColor[potentialGrade]!),
        borderRadius: BorderRadius.circular(DimenConfig.subDimen),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 0),
            color: ItemColor.iconBoxShadow,
          ),
          BoxShadow(
            offset: Offset(0, 1),
            color: ItemColor.iconBoxShadow,
          ),
          BoxShadow(
            offset: Offset(-1, 0),
            color: ItemColor.iconBoxShadow,
          ),
          BoxShadow(
            offset: Offset(0, -1),
            color: ItemColor.iconBoxShadow,
          ),
        ],
      ),
      child: SizedBox(
        width: FontConfig.minSize * 1.5,
        height: FontConfig.minSize * 1.5,
        child: Center(
          child: Text(
            StaticSwitchConfig.potentialGradeCircleText[potentialGrade]!,
            style: TextStyle(
                color: ItemColor.commonInfoText,
                fontSize: FontConfig.minSize,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      offset: Offset(2, 0),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(0, 2),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(-2, 0),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(0, -2),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(1, 1),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(-1, -1),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(-1, 1),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                  Shadow(
                      offset: Offset(1, -1),
                      color: StaticSwitchConfig
                          .potentialGradeIconTextShadowColor[potentialGrade]!),
                ]),
          ),
        ),
      ),
    );
  }
}
