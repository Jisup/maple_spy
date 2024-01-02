import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/model/equipment/android_item_model.dart';
import 'package:maple_app/model/equipment/beauty_item_model.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/page/equipment/cash/cash_info.dart';

final equipmentSelectCashTabProvider = StateProvider((_) => 'preset1');

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
    final selectCashTab = ref.watch(equipmentSelectCashTabProvider);

    final List<CashItemEquipment>? cashList = switch (selectCashTab) {
      'preset1' => cash?.cashItemEquipmentPreset1,
      'preset2' => cash?.cashItemEquipmentPreset2,
      'preset3' => cash?.cashItemEquipmentPreset3,
      _ => [],
    };

    return Container(
      margin: EdgeInsets.only(
          left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
      padding: EdgeInsets.only(
          left: DimenConfig.subDimen, right: DimenConfig.subDimen),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        children: StaticListConfig.equipmentCashList.map((slot) {
          return FractionallySizedBox(
            widthFactor: 1 / 5,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: slot['name'] != null
                  ? CashInfo(
                      name: slot['name'],
                      cashItem: cashList!.singleWhere(
                          (element) =>
                              element.cashItemEquipmentSlot == slot['slot'],
                          orElse: () => CashItemEquipment()))
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}
