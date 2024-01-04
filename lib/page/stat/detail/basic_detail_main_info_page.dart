import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/widget/common/custom_text_widget.dart';

class BasicDetailInfoPage extends ConsumerWidget {
  const BasicDetailInfoPage({
    super.key,
    required this.fightingPower,
    required this.minStatPower,
    required this.maxStatPower,
    required this.stats,
    required this.characterClass,
  });

  final String fightingPower;
  final String minStatPower, maxStatPower;
  final dynamic stats;
  final String characterClass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: DimenConfig.commonDimen,
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: CustomTextWidget(
                  text: '전투력',
                  size: FontConfig.middleSize,
                  color: Colors.yellow,
                  subColor: Colors.black87,
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CustomTextWidget(
                    text: fightingPower,
                    size: FontConfig.middleSize,
                    color: Colors.yellow,
                    subColor: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: SymbolColor.startBorder,
          height: DimenConfig.commonDimen * 2,
          thickness: 2,
          indent: DimenConfig.commonDimen * 2,
          endIndent: DimenConfig.commonDimen * 2,
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: DimenConfig.commonDimen,
            left: DimenConfig.maxDimen,
            right: DimenConfig.maxDimen,
          ),
          child: Wrap(
            children: StaticListConfig.statMainList.map((stat) {
              var even = StaticListConfig.statMainList.indexOf(stat) % 2 == 0;
              return FractionallySizedBox(
                widthFactor: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: !even
                          ? EdgeInsets.only(left: DimenConfig.commonDimen)
                          : null,
                      child: CustomTextWidget(
                        text: stat,
                        size: FontConfig.commonSize,
                        color: StaticSwitchConfig.switchClassMainStat(
                                    characterClass) ==
                                stat
                            ? Colors.yellow
                            : Colors.white,
                        subColor: Colors.black26,
                      ),
                    ),
                    Container(
                      margin: even
                          ? EdgeInsets.only(right: DimenConfig.commonDimen)
                          : null,
                      child: Text(
                        stats[stat],
                        style: TextStyle(
                            color: StaticSwitchConfig.switchClassMainStat(
                                        characterClass) ==
                                    stat
                                ? Colors.yellow
                                : Colors.white,
                            fontSize: FontConfig.commonSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
