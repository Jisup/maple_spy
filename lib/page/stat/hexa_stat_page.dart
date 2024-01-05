import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/controller/stat_controller.dart';
import 'package:maple_app/page/stat/detail/hexa_detail_info_page.dart';

class HexaStatPage extends ConsumerWidget {
  const HexaStatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
          children: StatController.hexaMatrixStat.characterHexaStatCore != null
              ? StatController.hexaMatrixStat.characterHexaStatCore!
                  .map((hexaStatCore) =>
                      HexaDetailInfoPage(hexaStatCore: hexaStatCore))
                  .toList()
              : [],
        ),
      ),
    );
  }
}
