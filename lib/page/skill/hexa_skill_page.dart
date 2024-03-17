import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/skill_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/skill/hexa/hexa_skill_core_page.dart';
import 'package:maplespy/provider/skill_hexa_notifier.dart';

class HexaSkillPage extends ConsumerWidget {
  const HexaSkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHexaNotifier = ref.read(asyncSkillHexaProvider.notifier);
    final hexaMatrix = ref.watch(asyncHexaNotifier.hexaMatrixProvider);

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
            child: hexaMatrix.characterHexaCoreEquipment != null &&
                    hexaMatrix.characterHexaCoreEquipment?.length != 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 85),
                    child: Column(
                      children: [
                        HexaSkillCorePage(
                            type: '마스터리 코어',
                            hexaSkillCore: hexaMatrix.hexaMasterlyCore),
                        HexaSkillCorePage(
                            type: '스킬 코어',
                            hexaSkillCore: hexaMatrix.hexaSkillCore),
                        HexaSkillCorePage(
                            type: '강화 코어',
                            hexaSkillCore: hexaMatrix.hexaEnhanceCore),
                        HexaSkillCorePage(
                            type: '공용 코어',
                            hexaSkillCore: hexaMatrix.hexaCommonCore),
                        HexaSkillCorePage(
                            type: '기타 코어',
                            hexaSkillCore: hexaMatrix.hexaEtcCore),
                      ],
                    ),
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.hexaSkillPageVariableError),
          ),
        ),
      ),
    );
  }
}
