import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/stat/ability_stat_model.dart';
import 'package:maple_app/model/stat/hyper_stat_model.dart';

class AbilityHyperStatPage extends ConsumerWidget {
  const AbilityHyperStatPage(
      {super.key, required this.abilityStat, required this.hyperStat});

  final AbilityStat abilityStat;
  final HyperStat hyperStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
