import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/link/link_skill_info_view.dart';
import 'package:maplespy/page/skill/link/link_skill_whole_view.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/skill_link_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class LinkSkillPage extends ConsumerWidget {
  const LinkSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLinkNotifier = ref.read(asyncSkillLinkProvider.notifier);
    final linkSkill = ref.watch(asyncLinkNotifier.linkSkillProvider);

    final skillToggle = ref.watch(skillToggleProvider);

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
                ? Container(
                    margin: EdgeInsets.only(bottom: 85),
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(bottom: DimenConfig.commonDimen),
                          alignment: Alignment.centerLeft,
                          child: CustomTextWidget(
                            text: '기본 링크',
                            size: FontConfig.middleDownSize,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                          child: skillToggle
                              ? LinkSkillWholeView(
                                  skill: linkSkill.characterOwnedLinkSkill!)
                              : LinkSkillInfoView(
                                  skill: linkSkill.characterOwnedLinkSkill!),
                        ),
                        linkSkill.characterLinkSkill != null &&
                                linkSkill.characterLinkSkill!.isNotEmpty
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: DimenConfig.commonDimen),
                                    alignment: Alignment.centerLeft,
                                    child: CustomTextWidget(
                                      text: '장착 링크',
                                      size: FontConfig.middleDownSize,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: DimenConfig.maxDimen / 2),
                                    child: Wrap(
                                      spacing: DimenConfig.commonDimen,
                                      runSpacing: DimenConfig.commonDimen +
                                          DimenConfig.subDimen,
                                      alignment: WrapAlignment.start,
                                      children: linkSkill.characterLinkSkill!
                                          .map((skill) {
                                        return skillToggle
                                            ? LinkSkillWholeView(skill: skill)
                                            : LinkSkillInfoView(skill: skill);
                                      }).toList(),
                                    ),
                                  )
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.linkSkillPageVariableError),
          ),
        ),
      ),
    );
  }
}
