import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/page/skill/hexa/hexa_skill_part_view.dart';
import 'package:maplespy/page/skill/hexa/hexa_skill_whole_view.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HexaSkillCorePage extends ConsumerWidget {
  const HexaSkillCorePage({
    super.key,
    required this.type,
    required this.hexaSkillCore,
  });

  final String type;
  final List<CharacterHexaCoreEquipment>? hexaSkillCore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillToggle = ref.watch(skillToggleProvider);

    return hexaSkillCore != null && hexaSkillCore!.isNotEmpty
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
              LayoutBuilder(
                builder: (childContext, viewportConstraints) => Container(
                  width: viewportConstraints.maxWidth,
                  margin: EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                  child: Wrap(
                    spacing: DimenConfig.commonDimen,
                    runSpacing: DimenConfig.commonDimen + DimenConfig.subDimen,
                    alignment: WrapAlignment.start,
                    children: hexaSkillCore!.map((core) {
                      return skillToggle
                          ? HexaSkillWholeView(core: core)
                          : HexaSkillPartView(core: core);
                    }).toList(),
                  ),
                ),
              )
            ],
          )
        : SizedBox.shrink();
  }
}
