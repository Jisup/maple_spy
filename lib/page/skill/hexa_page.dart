import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/skill/hexamatrix_skill_model.dart';
import 'package:maple_app/model/skill/skill_model.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class HexaPage extends ConsumerWidget {
  const HexaPage(
      {super.key, required this.hexaSkill, required this.hexamatrix});

  final Skill? hexaSkill;
  final HexamatrixSkill? hexamatrix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return hexaSkill?.characterSkill?.length != 0
        ? Wrap(
            runSpacing: DimenConfig.commonDimen,
            children: hexaSkill!.characterSkill!.reversed.map((skill) {
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
                              decoration: BoxDecoration(
                                  color: SkillColor.background,
                                  borderRadius: BorderRadius.circular(
                                      RadiusConfig.subRadius),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: RadiusConfig.subRadius,
                                        offset: Offset(-3, -3),
                                        color: Colors.white70,
                                        inset: true),
                                    BoxShadow(
                                        blurRadius: RadiusConfig.subRadius,
                                        offset: Offset(3, 3),
                                        color: Colors.black87,
                                        inset: true)
                                  ]),
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
                                            shadowSize: 1,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                            shadowSize: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        : MainErrorPage(message: '헥사 코어\n정보가 없어요!');
  }
}
