import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/model/stat/stat_model.dart';
import 'package:maple_app/page/stat/detail/basic_detail_main_info_page.dart';

class BasicStatPage extends ConsumerWidget {
  const BasicStatPage({super.key, required this.basicStat});

  final Stat basicStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    String findStat(String statName) {
      return basicStat.finalStat!
              .singleWhere((element) => element.statName == statName)
              .statValue ??
          "";
    }

    return Container(
      color: StatColor.statBackgroundColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: colorScheme.primary,
                    child: BasicDetailInfoPage(
                        fightingPower: findStat('전투력'),
                        minStatPower: findStat('최소 스탯공격력'),
                        maxStatPower: findStat('최대 스탯공격력'),
                        stats: {
                          'STR': findStat('STR'),
                          'DEX': findStat('DEX'),
                          'INT': findStat('INT'),
                          'LUK': findStat('LUK'),
                        },
                        characterClass: basicStat.characterClass ?? "")),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
