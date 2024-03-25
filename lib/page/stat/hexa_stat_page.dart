import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/detail/hexa_stat_detail_info_page.dart';
import 'package:maplespy/provider/stat_hexa_notifier.dart';

class HexaStatPage extends ConsumerWidget {
  const HexaStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHexaNotifier = ref.read(asyncStatHexaProvider.notifier);
    final hexaMatrixStat = ref.watch(asyncHexaNotifier.hexaMatrixStatProvider);

    return hexaMatrixStat.characterClass != null
        ? hexaMatrixStat.characterHexaStatCore!.isNotEmpty
            ? Container(
                decoration: const BoxDecoration(
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
                    children: hexaMatrixStat.characterHexaStatCore!
                        .map((hexaStatCore) => HexaStatDetailInfoPage(
                              characterClass: hexaMatrixStat.characterClass!,
                              hexaStatCore: hexaStatCore,
                            ))
                        .toList(),
                  ),
                ),
              )
            : MainErrorPage(
                message: ErrorMessageConfig.hexaStatPageVariableError)
        : MainErrorPage(message: ErrorMessageConfig.hexaStatPageError);
  }
}
