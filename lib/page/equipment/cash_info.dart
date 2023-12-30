import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/widget/equipment/equipment_empty_slot_widget.dart';

class CashInfo extends ConsumerWidget {
  const CashInfo({super.key, required this.slot, required this.preset});

  final dynamic slot;
  final List<CashItemEquipment> preset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final CashItemEquipment cash = preset.singleWhere((element) => element.cashItemEquipmentSlot == slot['slot'], orElse: () => CashItemEquipment());

    return cash.cashItemName != null
        ? Container(
            margin: EdgeInsets.all(DimenConfig.subDimen),
            decoration: BoxDecoration(color: colorScheme.onSecondary, borderRadius: BorderRadius.circular(RadiusConfig.subRadius), boxShadow: [
              BoxShadow(blurRadius: RadiusConfig.subRadius, offset: Offset(-3, -3), color: Colors.white, inset: true),
              BoxShadow(blurRadius: RadiusConfig.subRadius, offset: Offset(3, 3), color: Colors.black87, inset: true),
            ]),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  child: Text(
                    slot['name'],
                    style: TextStyle(fontSize: FontConfig.minSize, letterSpacing: SpacingConfig.minSpacing, color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage(cash.cashItemIcon!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          )
        : EquipmentEmptySlotWidget(name: slot['name']);
  }
}
