import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/stat/detail/ability_detail_preset_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/stat_ablity_hyper_notifier.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';
import 'package:maplespy/widget/detail_page/detail_preset_tab.dart';

class AbilityDetailInfoPage extends ConsumerWidget {
  const AbilityDetailInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final asyncAbilityNotifier =
        ref.read(asyncStatAbilityHyperProvider.notifier);
    final abilityStat = ref.watch(asyncAbilityNotifier.abilityStatProvider);

    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: EdgeInsets.only(
              left: DimenConfig.commonDimen * 2,
              right: DimenConfig.commonDimen * 2,
              top: DimenConfig.subDimen,
              bottom: DimenConfig.subDimen,
            ),
            color: colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: DimenConfig.subDimen,
                    bottom: DimenConfig.subDimen,
                  ),
                  child: CustomTextWidget(
                      text: 'ABILITY',
                      size: FontConfig.middleSize,
                      color: StatColor.statTitle),
                ),
                abilityStat.presetNo != null
                    ? Row(
                        children: StaticListConfig.abilityPresetTabList
                            .map((tab) => DetailPresetTab(
                                  tab: tab,
                                  provider: abilityStatPresetProvider,
                                  color: StatColor.statTitle,
                                  isBright: true,
                                ))
                            .toList(),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(DimenConfig.commonDimen),
          padding: EdgeInsets.only(
              top: DimenConfig.commonDimen, bottom: DimenConfig.commonDimen),
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
          ),
          child: const AbilityDetailPresetPage(),
        )
      ],
    );
  }
}
