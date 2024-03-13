import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/skill/hexa_matrix_model.dart';
import 'package:maplespy/page/skill/detail/hexa_skill_detail_info_page.dart';
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
              Container(
                margin: EdgeInsets.only(bottom: DimenConfig.maxDimen / 2),
                child: Wrap(
                  runSpacing: DimenConfig.commonDimen,
                  children: hexaSkillCore!.map((core) {
                    return HexaSkillDetailInfoPage(core: core);
                  }).toList(),
                ),
              )
            ],
          )
        : SizedBox.shrink();
  }
}
