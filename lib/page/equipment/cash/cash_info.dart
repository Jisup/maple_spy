import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/widget/equipment/equipment_slot_widget.dart';

class CashInfo extends ConsumerWidget {
  const CashInfo({super.key, required this.name, required this.cashItem});

  final String name;
  final CashItemEquipment cashItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return cashItem.cashItemName != null
        ? EquipmentSlotWidget(
            name: name,
            imageUrl: cashItem.cashItemIcon,
          )
        : EquipmentSlotWidget(name: name);
  }
}
