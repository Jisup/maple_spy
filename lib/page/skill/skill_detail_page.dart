import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/main_skill_model.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/page/main_skill_page.dart';
import 'package:maple_app/page/skill/hexa_page.dart';
import 'package:maple_app/page/skill/link_page.dart';
import 'package:maple_app/page/skill/v_page.dart';

class SkillDetailPage extends ConsumerWidget {
  const SkillDetailPage({super.key, required this.mainSkill});

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
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: switch (skillTab) {
              'hexa' => HexaPage(
                  hexaSkill: mainSkill.hexaSkill,
                  hexamatrix: mainSkill.hexamatrix,
                ),
              'v' => VPage(
                  vSkill: mainSkill.vSkill,
                  vmatrix: mainSkill.vmatrix,
                ),
              'link' => LinkPage(link: mainSkill.link),
              _ =>
                MainErrorPage(message: 'skill select tab\nhas something error'),
            },
          ),
        ),
      ),
    );
  }
}
