import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_info.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_stat.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';
import 'package:maplespy/widget/detail_page/detail_select_sub_tab.dart';

class UnionDetailRaiderEffect extends ConsumerWidget {
  const UnionDetailRaiderEffect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionRadierNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final raiderSelectTab = ref.watch(unionRaiderSelectTabProvider);
    final unionRadierStat =
        ref.watch(unionRadierNotifier.unionRaiderProvider).unionRaiderStat;
    final unionRadierOccupiedStat =
        ref.watch(unionRadierNotifier.unionRaiderProvider).unionOccupiedStat;

    return Container(
      padding: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen * 2,
      ),
      color: colorScheme.onPrimary,
      child: Column(
        children: [
          Semantics(
            label: '구분 선',
            readOnly: true,
            child: Divider(
                height: DimenConfig.commonDimen * 2,
                thickness: 2,
                indent: DimenConfig.commonDimen * 2,
                endIndent: DimenConfig.commonDimen * 2,
                color: colorScheme.primary),
          ),
          DetailSelectSubTab(
            tabList: StaticListConfig.unionRadierTabList,
            provider: unionRaiderSelectTabProvider,
          ),
          switch (raiderSelectTab) {
            'occupied' =>
              UnionDetailRaiderStat(statList: unionRadierOccupiedStat!),
            'inner' => UnionDetailRaiderStat(statList: unionRadierStat!),
            _ => MainErrorPage(
                message: ErrorMessageConfig.unionRaiderPageVariableError),
          },
          Semantics(
            label: '구분 선',
            readOnly: true,
            child: Divider(
                height: DimenConfig.commonDimen * 2,
                thickness: 2,
                indent: DimenConfig.commonDimen * 2,
                endIndent: DimenConfig.commonDimen * 2,
                color: colorScheme.primary),
          ),
          UnionDetailRaiderInfo(),
        ],
      ),
    );
  }
}
