import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/union/union_raider_model.dart';
import 'package:maplespy/page/main_error_page.dart';
import 'package:maplespy/page/union/detail/union_detail_info_page.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_effect.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_info.dart';
import 'package:maplespy/page/union/detail/union_detail_raider_table.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/provider/union_raider_notifier.dart';
import 'package:maplespy/widget/detail_page/detail_preset_tab.dart';

class UnionRaiderPage extends ConsumerWidget {
  const UnionRaiderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final unionRaiderNotifier = ref.read(asyncUnionRaiderProvider.notifier);
    final union = ref.watch(unionRaiderNotifier.unionProvider);
    final unionRaider = ref.watch(unionRaiderNotifier.unionRaiderProvider);
    final selectUnionRaiderTab = ref.watch(unionRaiderPresetProvider);

    final UnionRaiderPreset? unionRaiderPreset = switch (selectUnionRaiderTab) {
      'preset1' => unionRaider.unionRaiderPreset1,
      'preset2' => unionRaider.unionRaiderPreset2,
      'preset3' => unionRaider.unionRaiderPreset3,
      'preset4' => unionRaider.unionRaiderPreset4,
      'preset5' => unionRaider.unionRaiderPreset5,
      _ => switch (unionRaider.usePresetNo) {
          1 => unionRaider.unionRaiderPreset1,
          2 => unionRaider.unionRaiderPreset2,
          3 => unionRaider.unionRaiderPreset3,
          4 => unionRaider.unionRaiderPreset4,
          5 => unionRaider.unionRaiderPreset5,
          _ => UnionRaiderPreset()
        }
    };

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) =>
          ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: viewportConstraints.maxWidth,
          minHeight: viewportConstraints.maxHeight,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: union.unionGrade != null && unionRaiderPreset != null
                ? Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: DimenConfig.commonDimen * 2),
                        color: colorScheme.primary,
                        child: Column(
                          children: [
                            UnionDetailInfoPage(
                              unionGrade: union.unionGrade!,
                              unionSubGrade: union.unionSubGrade!,
                              unionLevel: union.unionLevel ?? '0',
                              gradeType:
                                  union.unionGrade?.contains('그랜드') ?? false,
                            ),
                            UnionDetailRaiderTable(
                                unionRaider: unionRaiderPreset),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: DimenConfig.commonDimen,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: StaticListConfig
                                    .unionRaiderPresetTabList
                                    .map((tab) => DetailPresetTab(
                                          tab: tab,
                                          provider: unionRaiderPresetProvider,
                                          isBright: true,
                                          color: CommonColor.main,
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      UnionDetailRaiderEffect(
                        raiderInnerStat: unionRaiderPreset.unionRaiderStat,
                        raiderOccupiedStat: unionRaiderPreset.unionOccupiedStat,
                      ),
                      UnionDetailRaiderInfo(
                        raiderInfo: unionRaiderPreset.unionInfo,
                      ),
                    ],
                  )
                : MainErrorPage(
                    message: ErrorMessageConfig.unionRaiderPageVariableError),
          ),
        ),
      ),
    );
  }
}
