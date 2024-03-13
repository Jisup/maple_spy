import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/detail/link_skill_detail_info_page.dart';
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
                ? Column(
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
                        child: LinkSkillDetailInfoPage(
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
                                    runSpacing: DimenConfig.commonDimen,
                                    children: linkSkill.characterLinkSkill!
                                        .map((skill) {
                                      return LinkSkillDetailInfoPage(
                                          skill: skill);
                                    }).toList(),
                                  ),
                                )
                              ],
                            )
                          : SizedBox.shrink(),
                    ],
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.linkSkillPageVariableError),
          ),
        ),
      ),
    );
  }
}
