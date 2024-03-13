import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class LinkSkillDetailInfoPage extends ConsumerWidget {
  const LinkSkillDetailInfoPage({super.key, required this.skill});

  final CharacterLinkSkill skill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

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
          borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
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
                    decoration: customBoxDecoration(
                      type: 'equipment_no',
                      startColor: SkillColor.background,
                    ),
                    child: Image.network(
                      skill.skillIcon!,
                      fit: BoxFit.contain,
                      semanticLabel: '링크 스킬 이미지',
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
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
                                    decoration: BoxDecoration(
                                      color: SkillColor.background,
                                      borderRadius: BorderRadius.circular(
                                          RadiusConfig.maxRadius),
                                    ),
                                    child: CustomTextWidget(
                                      text: skill.skillName!,
                                      size: FontConfig.commonSize,
                                      color: Colors.white,
                                      subColor: colorScheme.primary,
                                    )))),
                        Expanded(
                            child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: CustomTextWidget(
                                      text: skill.skillLevel!.toString(),
                                      size: FontConfig.middleSize,
                                      color: Colors.white,
                                      subColor: colorScheme.primary,
                                    )))),
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
    ;
  }
}
