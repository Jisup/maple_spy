import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/model/equipment/beauty_item_model.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/page/equipment/cash/cash_info.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_preset_tab.dart';

class CashPage extends ConsumerWidget {
  const CashPage(
      {super.key,
      required this.cash,
      required this.beauty,
      required this.android});

  final CashItem? cash;
  final BeautyItem? beauty;
  final AndroidItem? android;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectCashTab = ref.watch(equipmentCashPresetProvider);

    final List<CashItemEquipment>? cashList = switch (selectCashTab) {
      'main' => cash?.cashItemEquipmentBase,
      'preset1' => cash?.cashItemEquipmentPreset1,
      'preset2' => cash?.cashItemEquipmentPreset2,
      'preset3' => cash?.cashItemEquipmentPreset3,
      _ => [],
    };

    return Container(
      margin: EdgeInsets.only(
          left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
      child: LayoutBuilder(
        builder:
            (BuildContext childContext, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: viewportConstraints.maxWidth,
                minHeight: viewportConstraints.maxHeight),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: DimenConfig.commonDimen,
                        right: DimenConfig.commonDimen,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: StaticListConfig.cashPresetTabList
                            .map((tab) => DetailPresetTab(
                                tab: tab,
                                provider: equipmentCashPresetProvider,
                                isBright: false))
                            .toList(),
                      ),
                    ),
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      children: StaticListConfig.equipmentCashList.map((slot) {
                        return FractionallySizedBox(
                          widthFactor: 1 / 5.0125,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: slot['name'] != null
                                ? CashInfo(
                                    name: slot['name'],
                                    cashItem: cashList!.singleWhere(
                                        (element) =>
                                            element.cashItemEquipmentSlot ==
                                            slot['slot'],
                                        orElse: () => CashItemEquipment()))
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
