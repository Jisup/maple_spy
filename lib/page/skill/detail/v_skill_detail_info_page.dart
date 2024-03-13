import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class VDetailInfoPage extends ConsumerWidget {
  const VDetailInfoPage(
      {super.key,
      required this.skillDetail,
      required this.skillName,
      required this.skillLevel});

  final VDetail? skillDetail;
  final String skillName;
  final String skillLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(left: DimenConfig.commonDimen),
      child: Column(
        children: [
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  bottom: DimenConfig.subDimen,
                ),
                padding: EdgeInsets.only(
                  left: DimenConfig.commonDimen,
                  right: DimenConfig.commonDimen,
                ),
                decoration: skillDetail != null
                    ? customBoxDecoration(
                        type: 'skill_in_out_bar',
                        startColor: StaticSwitchConfig
                            .vCoreStartBackgroundColor[skillDetail!.skillType],
                        endColor: StaticSwitchConfig
                            .vCoreEndBackgroundColor[skillDetail!.skillType],
                        borderColor: StaticSwitchConfig
                            .vCoreStartBackgroundColor[skillDetail!.skillType],
                      )
                    : customBoxDecoration(
                        type: 'skill_in_out_bar',
                      ),

                /**-----skill name */
                child: CustomTextWidget(
                  text: skillName,
                  size: FontConfig.commonSize,
                  color: Colors.white,
                  subColor: colorScheme.primary,
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**-----skill level */
                  CustomTextWidget(
                    text: skillLevel,
                    size: FontConfig.middleSize,
                    color: Colors.white,
                    subColor: colorScheme.primary,
                  ),

                  /**-----skill slot total level */
                  CustomTextWidget(
                    text: skillDetail == null || skillDetail!.slotLevel == 0
                        ? ''
                        : ' (+${skillDetail!.slotLevel})',
                    size: FontConfig.middleSize,
                    color: SkillColor.background,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
