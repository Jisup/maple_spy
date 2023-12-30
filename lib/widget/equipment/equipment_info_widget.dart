import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/cash_info.dart';
import 'package:maple_app/page/equipment/item_info.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/provider/equipment_notifier.dart';

class EquipmentInfoWidget extends ConsumerWidget {
  const EquipmentInfoWidget({super.key, required this.equipmentList, required this.type, required this.item, required this.cash});

  final List equipmentList;
  final String type;
  final Item? item;
  final CashItem? cash;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cashPreset = ref.watch(equipmentSelectCashTabProvider);
    final List<CashItemEquipment>? preset = switch (cashPreset) {
      'preset1' => cash?.cashItemEquipmentPreset1,
      'preset2' => cash?.cashItemEquipmentPreset2,
      'preset3' => cash?.cashItemEquipmentPreset3,
      _ => [],
    };
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
        padding: EdgeInsets.only(left: DimenConfig.subDimen, right: DimenConfig.subDimen),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          children: equipmentList.map((slot) {
            return Container(
              child: FractionallySizedBox(
                widthFactor: 1 / 5,
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: slot['name'] == null
                        ? null
                        : switch (type) {
                            'item' => ItemInfo(name: slot['name'], item: slot['slot'] == null ? null : item!.itemEquipment!.singleWhere((element) => element.itemEquipmentSlot == slot['slot'], orElse: () => ItemEquipment())),
                            'cash' => CashInfo(slot: slot, preset: preset!),
                            _ => MainErrorPage(message: 'response equipment is error'),
                          }),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
