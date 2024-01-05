import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/stat/hexa_matrix_stat_model.dart';
import 'package:maple_app/page/stat/detail/hexa_detail_level_page.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class HexaDetailInfoPage extends ConsumerWidget {
  const HexaDetailInfoPage({super.key, required this.hexaStatCore});

  final CharacterHexaStatCore hexaStatCore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: DimenConfig.commonDimen * 2,
      children: [
        /**-----main */
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Row(
            children: [
              HexaDetailLevelPage(
                level: hexaStatCore.mainStatLevel!,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: DimenConfig.commonDimen * 2,
                  ),
                  child: CustomTextWidget(
                    text: hexaStatCore.mainStatName ?? '',
                    size: FontConfig.middleSize,
                    color: Colors.white,
                    subColor: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ),
        /**-----sub 1 */
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Row(
            children: [
              HexaDetailLevelPage(
                level: hexaStatCore.subStatLevel1!,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: DimenConfig.commonDimen * 2,
                  ),
                  child: CustomTextWidget(
                    text: hexaStatCore.subStatName1 ?? '',
                    size: FontConfig.middleSize,
                    color: Colors.white,
                    subColor: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ),
        /**-----sub 2 */
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Row(
            children: [
              HexaDetailLevelPage(
                level: hexaStatCore.subStatLevel2!,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: DimenConfig.commonDimen * 2,
                  ),
                  child: CustomTextWidget(
                    text: hexaStatCore.subStatName2 ?? '',
                    size: FontConfig.middleSize,
                    color: Colors.white,
                    subColor: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
