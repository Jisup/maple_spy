import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/page/skill/v/v_skill_part_view.dart';
import 'package:maplespy/page/skill/v/v_skill_whole_view.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class VSkillCorePage extends ConsumerWidget {
  const VSkillCorePage({
    super.key,
    required this.type,
    required this.vSkillCore,
  });

  final String type;
  final List<CharacterSkill>? vSkillCore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillToggle = ref.watch(skillToggleProvider);

    return vSkillCore != null && vSkillCore!.isNotEmpty
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.commonDimen),
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: type,
                  size: FontConfig.middleDownSize,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                child: Wrap(
                  spacing: DimenConfig.commonDimen,
                  runSpacing: DimenConfig.commonDimen + DimenConfig.subDimen,
                  children: vSkillCore!.reversed.map(
                    (core) {
                      return skillToggle
                          ? VSkillWholeView(core: core)
                          : VSkillPartView(core: core);
                    },
                  ).toList(),
                ),
              )
            ],
          )
        : SizedBox.shrink();
  }
}
