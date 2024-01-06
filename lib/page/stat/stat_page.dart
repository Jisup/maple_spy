import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/controller/stat_controller.dart';
import 'package:maplespy/model/main_stat_model.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/main_stat_page.dart';
import 'package:maplespy/page/stat/ability_hyper_stat_page.dart';
import 'package:maplespy/page/stat/basic_stat_page.dart';
import 'package:maplespy/page/stat/hexa_stat_page.dart';

class StatPage extends ConsumerWidget {
  const StatPage({super.key, required this.mainStat});

  final MainStat mainStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statTab = ref.watch(statSelectTabProvider);

    StatController(mainStat: mainStat);

    return switch (statTab) {
      'basic' => BasicStatPage(),
      'hexa' => HexaStatPage(),
      'ability_hyper' => AbilityHyperStatPage(),
      _ => MainErrorPage(message: 'stat select tab\nhas something error'),
    };
  }
}
