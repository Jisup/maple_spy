import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/provider/skill_link_notifier.dart';
import 'package:maplespy/widget/common/custom_box_decoration_widget.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class LinkSkillPage extends ConsumerWidget {
  const LinkSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final asyncLinkNotifier = ref.read(asyncSkillLinkProvider.notifier);
    final linkSkill = ref.watch(asyncLinkNotifier.linkSkillProvider);

    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      padding: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            SingleChildScrollView(
          controller:
              ref.read(skillControllerProvider.notifier).scrollController,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: linkSkill.characterOwnedLinkSkill != null
                ? Wrap(
                    runSpacing: DimenConfig.commonDimen,
                    children: linkSkill.characterLinkSkill!.map((skill) {
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
                          borderRadius:
                              BorderRadius.circular(DimenConfig.commonDimen),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(DimenConfig.commonDimen),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white70,
                              ),
                              borderRadius: BorderRadius.circular(
                                  DimenConfig.commonDimen),
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
                                          padding: EdgeInsets.all(
                                              DimenConfig.commonDimen),
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
                                              margin: EdgeInsets.only(
                                                  left:
                                                      DimenConfig.commonDimen),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child:
                                                          FractionallySizedBox(
                                                              widthFactor: 1,
                                                              child: Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    bottom: DimenConfig
                                                                        .subDimen,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: SkillColor
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            RadiusConfig.maxRadius),
                                                                  ),
                                                                  child:
                                                                      CustomTextWidget(
                                                                    text: skill
                                                                        .skillName!,
                                                                    size: FontConfig
                                                                        .commonSize,
                                                                    color: Colors
                                                                        .white,
                                                                    subColor:
                                                                        colorScheme
                                                                            .primary,
                                                                  )))),
                                                  Expanded(
                                                      child:
                                                          FractionallySizedBox(
                                                              widthFactor: 1,
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      CustomTextWidget(
                                                                    text: skill
                                                                        .skillLevel!
                                                                        .toString(),
                                                                    size: FontConfig
                                                                        .middleSize,
                                                                    color: Colors
                                                                        .white,
                                                                    subColor:
                                                                        colorScheme
                                                                            .primary,
                                                                  )))),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ))),
                      );
                    }).toList(),
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.linkSkillPageVariableError),
          ),
        ),
      ),
    );
  }
}
