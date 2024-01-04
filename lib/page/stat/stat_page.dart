import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/main_stat_model.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/page/main_stat_page.dart';
import 'package:maple_app/page/stat/ability_hyper_stat_page.dart';
import 'package:maple_app/page/stat/basic_stat_page.dart';
import 'package:maple_app/page/stat/hexa_stat_page.dart';

class StatPage extends ConsumerWidget {
  const StatPage({super.key, required this.mainStat});

  final MainStat mainStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statTab = ref.watch(statSelectTabProvider);

    return switch (statTab) {
      'basic' => BasicStatPage(
          basicStat: mainStat.stat,
        ),
      'hexa' => HexaStatPage(hexaStat: mainStat.hexaMatrixStat),
      'ability_hyper' => AbilityHyperStatPage(
          abilityStat: mainStat.abilityStat,
          hyperStat: mainStat.hyperStat,
        ),
      _ => MainErrorPage(message: 'stat select tab\nhas something error'),
    };
  }
}
