import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/stat_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/detail/hexa_detail_info_page.dart';
import 'package:maplespy/provider/common_provider.dart';

class HexaStatPage extends ConsumerWidget {
  const HexaStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -3) {
          ref.read(statSelectTabProvider.notifier).update((state) => 'basic');
        } else if (details.delta.dx > 3) {
          ref
              .read(statSelectTabProvider.notifier)
              .update((state) => 'ability/hyper');
        }
      },
      behavior: HitTestBehavior.translucent,
      child: StatController.hexaMatrixStat.characterClass != null
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/space_background.png',
                  ),
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              child: Container(
                  margin: EdgeInsets.only(
                    top: DimenConfig.commonDimen,
                    bottom: DimenConfig.commonDimen,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: StatController
                          .hexaMatrixStat.characterHexaStatCore!
                          .map((hexaStatCore) =>
                              HexaDetailInfoPage(hexaStatCore: hexaStatCore))
                          .toList())))
          : MainErrorPage(
              message: ErrorMessageConfig.hexaStatPageVariableError),
    );
  }
}
