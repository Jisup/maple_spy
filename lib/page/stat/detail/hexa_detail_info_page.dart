import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/stat/hexa_matrix_stat_model.dart';
import 'package:maplespy/page/stat/detail/hexa_detail_level_page.dart';
import 'package:maplespy/page/stat/detail/hexa_detail_option_page.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

class HexaDetailInfoPage extends ConsumerWidget {
  const HexaDetailInfoPage({
    super.key,
    required this.characterClass,
    required this.hexaStatCore,
  });

  final String characterClass;
  final CharacterHexaStatCore hexaStatCore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (hexaStatCore.mainStatName == '주력 스탯')
      hexaStatCore.mainStatName =
          StaticSwitchConfig.switchClassMainStat(className: characterClass);
    if (hexaStatCore.subStatName1 == '주력 스탯')
      hexaStatCore.subStatName1 =
          StaticSwitchConfig.switchClassMainStat(className: characterClass);
    if (hexaStatCore.subStatName2 == '주력 스탯')
      hexaStatCore.subStatName2 =
          StaticSwitchConfig.switchClassMainStat(className: characterClass);

    return Wrap(
      runSpacing: DimenConfig.commonDimen * 2,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: CustomTextWidget(
            text: 'MAIN STAT',
            size: FontConfig.commonSize,
            color: StatColor.statHexaText,
            subColor: Colors.white,
          ),
        ),
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
                  child: HexaDetailOptionPage(
                statName: hexaStatCore.mainStatName ?? '',
                statValue: StaticSwitchConfig.switchHexaStatValueToString(
                    name: hexaStatCore.mainStatName,
                    value: hexaStatCore.mainStatValue!),
                textColor: StatColor.statHexaMainText,
              )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: CustomTextWidget(
            text: 'ADDITIONAL STAT',
            size: FontConfig.commonSize,
            color: StatColor.statHexaText,
            subColor: Colors.white,
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
                  child: HexaDetailOptionPage(
                statName: hexaStatCore.subStatName1 ?? '',
                statValue: StaticSwitchConfig.switchHexaStatValueToString(
                    name: hexaStatCore.subStatName1,
                    value: hexaStatCore.subStatValue1!),
                textColor: StatColor.statHexaAdditionalText,
              )),
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
                  child: HexaDetailOptionPage(
                statName: hexaStatCore.subStatName2 ?? '',
                statValue: StaticSwitchConfig.switchHexaStatValueToString(
                    name: hexaStatCore.subStatName2,
                    value: hexaStatCore.subStatValue2!),
                textColor: StatColor.statHexaAdditionalText,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
