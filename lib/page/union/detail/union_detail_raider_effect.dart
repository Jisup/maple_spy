import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_stat.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_select_sub_tab.dart';

class UnionDetailRaiderEffect extends ConsumerWidget {
  const UnionDetailRaiderEffect({
    super.key,
    required this.raiderInnerStat,
    required this.raiderOccupiedStat,
  });

  final List<String>? raiderInnerStat;
  final List<String>? raiderOccupiedStat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final raiderSelectTab = ref.watch(unionRaiderSelectTabProvider);

    return Container(
      padding: EdgeInsets.only(
        top: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
      ),
      color: colorScheme.onPrimary,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: DimenConfig.commonDimen,
              right: DimenConfig.commonDimen,
            ),
            child: DetailSelectSubTab(
              tabList: StaticListConfig.unionRadierTabList,
              provider: unionRaiderSelectTabProvider,
            ),
          ),
          switch (raiderSelectTab) {
            'occupied' => UnionDetailRaiderStat(statList: raiderOccupiedStat!),
            'inner' => UnionDetailRaiderStat(statList: raiderInnerStat!),
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
        ],
      ),
    );
  }
}
