import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/model/main_skill_model.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/main_skill_page.dart';
import 'package:maplespy/page/skill/hexa_skill_page.dart';
import 'package:maplespy/page/skill/link_skill_page.dart';
import 'package:maplespy/page/skill/v_skill_page.dart';

class SkillPage extends ConsumerWidget {
  const SkillPage({
    super.key,
    required this.mainSkill,
  });

  final MainSkill mainSkill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillTab = ref.watch(skillSelectTabProvider);

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
            child: switch (skillTab) {
              'hexa' => HexaSkillPage(
                  hexaSkill: mainSkill.hexaSkill,
                  hexaDetail: mainSkill.hexaDetail,
                  hexaMatrix: mainSkill.hexaMatrix,
                ),
              'v' => VSkillPage(
                  vSkill: mainSkill.vSkill,
                  vDetail: mainSkill.vDetail,
                  vMatrix: mainSkill.vMatrix,
                ),
              'link' => LinkSkillPage(link: mainSkill.link),
              _ =>
                MainErrorPage(message: 'skill select tab\nhas something error'),
            },
          ),
        ),
      ),
    );
  }
}
