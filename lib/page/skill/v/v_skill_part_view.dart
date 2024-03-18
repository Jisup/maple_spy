import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/page/skill/v/v_skill_image_view.dart';

class VSkillPartView extends ConsumerWidget {
  const VSkillPartView({super.key, required this.core, required this.vDetail});

  final CharacterSkill core;
  final Map<String, VDetail> vDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (childContext, viewportConstraints) {
        return Container(
          width:
              (viewportConstraints.maxWidth - DimenConfig.commonDimen * 3) / 4,
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
                padding: EdgeInsets.all(DimenConfig.subDimen),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  borderRadius: BorderRadius.circular(DimenConfig.commonDimen),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: VSkillImageView(
                            skillDetail: vDetail[core.skillName],
                            skillIcon: core.skillIcon!,
                          ),
                        ),
                      ),
                    ],
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
                      core.skillLevel!.toString(),
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
