import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class LinkSkillWholeView extends ConsumerWidget {
  const LinkSkillWholeView({super.key, required this.skill});

  final CharacterLinkSkill skill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (childContext, viewportConstraints) {
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
            height:
                (viewportConstraints.maxWidth - DimenConfig.commonDimen * 3) /
                        4 -
                    DimenConfig.subDimen,
            padding: EdgeInsets.all(DimenConfig.subDimen),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white70,
              ),
              borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
            ),
            child: Row(
              children: [
                FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    padding: EdgeInsets.all(DimenConfig.middleDimen),
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
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: DimenConfig.commonDimen),
                    child: Column(
                      children: [
                        Expanded(
                            child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                    alignment: Alignment.center,
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
                                      size: FontConfig.middleDownSize,
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
                                      size: FontConfig.middleDownSize,
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
        );
      },
    );
  }
}
