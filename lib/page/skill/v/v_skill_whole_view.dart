import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/page/skill/v/v_skill_image_view.dart';
import 'package:maplespy/page/skill/v/v_skill_info_view.dart';

class VSkillWholeView extends ConsumerWidget {
  const VSkillWholeView({super.key, required this.core, required this.vDetail});

  final CharacterSkill core;
  final Map<String, VDetail> vDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  child: VSkillImageView(
                    skillDetail: vDetail[core.skillName],
                    skillIcon: core.skillIcon!,
                  ),
                ),
                Expanded(
                  child: VSkillInfoView(
                    skillDetail: vDetail[core.skillName],
                    skillName: core.skillName!,
                    skillLevel: core.skillLevel!.toString(),
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
