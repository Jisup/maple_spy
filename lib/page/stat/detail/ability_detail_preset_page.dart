import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/page/stat/detail/ability_detail_grade_page.dart';
import 'package:maplespy/page/stat/detail/ability_detail_lock_page.dart';
import 'package:maplespy/page/stat/detail/ability_detail_option_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/stat_ablity_hyper_notifier.dart';

class AbilityDetailPresetPage extends ConsumerWidget {
  const AbilityDetailPresetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAbilityNotifier =
        ref.read(asyncStatAbilityHyperProvider.notifier);
    final abilityStat = ref.watch(asyncAbilityNotifier.abilityStatProvider);

    final abilityStatPreset = ref.watch(abilityStatPresetProvider);
    final abilityPreset =
        asyncAbilityNotifier.abilityStatPresetInfo(abilityStatPreset);

    return abilityStat.abilityGrade != null
        ? Column(
            children: [
              AbilityDetailGradePage(
                grade: abilityPreset != null
                    ? abilityPreset.abilityPresetGrade
                    : abilityStat.abilityGrade,
              ),
              Wrap(
                  runSpacing: DimenConfig.minDimen,
                  children: abilityPreset != null
                      ? abilityPreset.abilityInfo!
                          .map((ability) =>
                              AbilityDetailOptionPage(ability: ability))
                          .toList()
                      : abilityStat.abilityInfo!
                          .map((ability) =>
                              AbilityDetailOptionPage(ability: ability))
                          .toList())
            ],
          )
        : AbilityDetailLockPage();
  }
}
