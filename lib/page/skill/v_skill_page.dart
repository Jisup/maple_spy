import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/model/skill/skill_model.dart';
import 'package:maplespy/model/skill/v_matrix_model.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/detail/v_skill_core_page.dart';
import 'package:maplespy/page/skill/detail/v_skill_detail_image_page.dart';
import 'package:maplespy/page/skill/detail/v_skill_detail_info_page.dart';
import 'package:maplespy/provider/skill_v_notifier.dart';

class VSkillPage extends ConsumerWidget {
  const VSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVNotifier = ref.read(asyncSkillVProvider.notifier);

    final vMatrix = ref.watch(asyncVNotifier.vMatrixProvider);
    final vSkillCore = ref.watch(asyncVNotifier.vSkillCoreProvider);
    final vEnhanceCore = ref.watch(asyncVNotifier.vEnhanceCoreProvider);
    final vEtcCore = ref.watch(asyncVNotifier.vEtcCoreProvider);

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
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight,
            ),
            child: vMatrix.characterVCoreEquipment != null &&
                    vMatrix.characterVCoreEquipment!.isNotEmpty
                ? Column(
                    children: [
                      VSkillCorePage(
                          type: '스킬 코어',
                          vSkillCore: vSkillCore as List<CharacterSkill>),
                      VSkillCorePage(
                          type: '강화 코어',
                          vSkillCore: vEnhanceCore as List<CharacterSkill>),
                      VSkillCorePage(
                          type: '기타 코어',
                          vSkillCore: vEtcCore as List<CharacterSkill>),
                    ],
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.vSkillPageVariableError),
          ),
        ),
      ),
    );
  }
}
