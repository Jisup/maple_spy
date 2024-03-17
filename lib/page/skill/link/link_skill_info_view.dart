import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/link_skill_model.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';

class LinkSkillInfoView extends ConsumerWidget {
  const LinkSkillInfoView({super.key, required this.skill});

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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: (viewportConstraints.maxWidth -
                            DimenConfig.commonDimen * 3) /
                        4 -
                    DimenConfig.subDimen,
                padding: EdgeInsets.all(DimenConfig.subDimen),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
                ),
                child: FractionallySizedBox(
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
              ),
              Positioned(
                bottom: 0,
                child: Transform.translate(
                  offset: Offset(0, DimenConfig.commonDimen),
                  child: Container(
                    width: (viewportConstraints.maxWidth -
                            DimenConfig.commonDimen * 3) /
                        8,
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary,
                      border: Border.all(
                        color: SkillColor.border,
                      ),
                      borderRadius:
                          BorderRadius.circular(RadiusConfig.subRadius),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      skill.skillLevel!.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontConfig.commonSize,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
