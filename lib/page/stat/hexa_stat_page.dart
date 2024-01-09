import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/controller/stat_controller.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/stat/detail/hexa_detail_info_page.dart';

class HexaStatPage extends ConsumerWidget {
  const HexaStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatController.hexaMatrixStat.characterClass != null
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
                children: StatController.hexaMatrixStat.characterHexaStatCore!
                    .map((hexaStatCore) =>
                        HexaDetailInfoPage(hexaStatCore: hexaStatCore))
                    .toList(),
              ),
            ),
          )
        : MainErrorPage(message: 'HEXA 스탯\n정보가 존재하지 않아요!');
  }
}
