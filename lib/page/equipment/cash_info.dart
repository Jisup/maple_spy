import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/widget/equipment/equipment_slot_widget.dart';

class CashInfo extends ConsumerWidget {
  const CashInfo({super.key, required this.slot, required this.preset});

  final dynamic slot;
  final List<CashItemEquipment> preset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CashItemEquipment cash = preset.singleWhere(
        (element) => element.cashItemEquipmentSlot == slot['slot'],
        orElse: () => CashItemEquipment());

    return cash.cashItemName != null
        ? EquipmentSlotWidget(
            name: slot['name'],
            imageUrl: cash.cashItemIcon,
          )
        : EquipmentSlotWidget(name: slot['name']);
  }
}
