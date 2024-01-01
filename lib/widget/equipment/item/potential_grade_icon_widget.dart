import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/util/make_list.dart';

class PotentialGradeIconWidget extends ConsumerWidget {
  const PotentialGradeIconWidget({super.key, required this.potentialGrade});

  final String potentialGrade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(right: DimenConfig.commonDimen),
      decoration: BoxDecoration(
        color: StaticSwitchConfig.potentialGradeColor[potentialGrade]!,
        border: Border.all(
            color: StaticSwitchConfig
                .potentialGradeIconBorderColor[potentialGrade]!),
        borderRadius: BorderRadius.circular(DimenConfig.subDimen),
        boxShadow: fourDirectionBoxShadow(1, ItemColor.iconBoxShadow, false),
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
                shadows: eightDirectionShadow(
                    2,
                    StaticSwitchConfig
                        .potentialGradeIconTextShadowColor[potentialGrade]!)),
          ),
        ),
      ),
    );
  }
}
