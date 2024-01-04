import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/model/skill/v_matrix_model.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/widget/common/custom_box_decoration_widget.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class VSkillPage extends ConsumerWidget {
  const VSkillPage(
      {super.key,
      required this.vSkill,
      required this.vDetail,
      required this.vMatrix});

  final Skill? vSkill;
  final Map<String, VDetail> vDetail;
  final VMatrix? vMatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return vSkill?.characterSkill?.length != 0
        ? Wrap(
            runSpacing: DimenConfig.commonDimen,
            children: vSkill!.characterSkill!.reversed.map((skill) {
              if (vDetail[skill.skillName] != null) {
                print(StaticSwitchConfig.vCoreStartBackgroundColor[
                    vDetail[skill.skillName]!.skillType]);
              }
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        SkillColor.startBackground,
                        SkillColor.endBackground,
                      ]),
                  border: Border.all(
                    color: SkillColor.border,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
                ),
                child: Container(
                  padding: EdgeInsets.all(DimenConfig.commonDimen),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius:
                        BorderRadius.circular(DimenConfig.commonDimen),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: AspectRatio(
                      aspectRatio: 4 / 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              padding: EdgeInsets.all(DimenConfig.commonDimen),
                              decoration: vDetail[skill.skillName] != null
                                  ? customBoxDecoration(
                                      type: 'in_out_square',
                                      startColor: StaticSwitchConfig
                                              .vCoreStartBackgroundColor[
                                          vDetail[skill.skillName]!.skillType],
                                      endColor: StaticSwitchConfig
                                              .vCoreEndBackgroundColor[
                                          vDetail[skill.skillName]!.skillType],
                                      borderColor: Colors.transparent,
                                    )
                                  : customBoxDecoration(
                                      type: 'no',
                                      startColor: SkillColor.background,
                                    ),

                              /**-----skill icon */
                              child: Image.network(
                                skill.skillIcon!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen),
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
                                        decoration: vDetail[skill.skillName] !=
                                                null
                                            ? customBoxDecoration(
                                                type: 'in_out_bar',
                                                startColor: StaticSwitchConfig
                                                        .vCoreStartBackgroundColor[
                                                    vDetail[skill.skillName]!
                                                        .skillType],
                                                endColor: StaticSwitchConfig
                                                        .vCoreEndBackgroundColor[
                                                    vDetail[skill.skillName]!
                                                        .skillType],
                                                borderColor: StaticSwitchConfig
                                                        .vCoreStartBackgroundColor[
                                                    vDetail[skill.skillName]!
                                                        .skillType],
                                              )
                                            : customBoxDecoration(
                                                type: 'in_out_bar',
                                              ),

                                        /**-----skill name */
                                        child: CustomTextWidget(
                                          text: skill.skillName!,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          /**-----skill level */
                                          CustomTextWidget(
                                            text: skill.skillLevel!.toString(),
                                            size: FontConfig.middleSize,
                                            color: Colors.white,
                                            subColor: colorScheme.primary,
                                          ),

                                          /**-----skill slot total level */
                                          CustomTextWidget(
                                            text:
                                                '${vDetail[skill.skillName] == null || vDetail[skill.skillName]!.slotLevel == 0 ? '' : ' (+${vDetail[skill.skillName]!.slotLevel})'}',
                                            size: FontConfig.middleSize,
                                            color: SkillColor.background,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        : MainErrorPage(message: 'V 코어\n정보가 없어요!');
  }
}
