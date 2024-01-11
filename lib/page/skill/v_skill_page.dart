import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/detail/v_detail_image_page.dart';
import 'package:maplespy/page/skill/detail/v_detail_info_page.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

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
    return vSkill?.characterSkill != null && vSkill?.characterSkill?.length != 0
        ? Wrap(
            runSpacing: DimenConfig.commonDimen,
            children: vSkill!.characterSkill!.reversed.map((skill) {
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
                              child: VDetailImagePage(
                                skillDetail: vDetail[skill.skillName],
                                skillIcon: skill.skillIcon!,
                              )),
                          Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: VDetailInfoPage(
                                skillDetail: vDetail[skill.skillName],
                                skillName: skill.skillName!,
                                skillLevel: skill.skillLevel!.toString(),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        : MainErrorPage(message: ErrorMessageConfig.vSkillPageVariableError);
  }
}
