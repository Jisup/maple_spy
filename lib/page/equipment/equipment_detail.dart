import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/static_config.dart';
import 'package:maple_app/model/main_equipment_model.dart';
import 'package:maple_app/page/equipment/detail_pet_with_symbol_info.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/widget/detail_page/detail_select_tab.dart';
import 'package:maple_app/widget/equipment/equipment_info.dart';

class EquipmentDetail extends ConsumerWidget {
  const EquipmentDetail({super.key, required this.equipment});

  final MainEquipment equipment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectTab = ref.watch(equipmentSelectTabProvider);
    return Column(
      children: [
        DetailSelectTabWidget(
          tabList: StaticConfig.detailEquipmentTab,
          provider: equipmentSelectTabProvider,
        ),
        switch (selectTab) {
          'item' => EquipmentInfoWidget(equipmentList: StaticConfig.equipmentItemList, type: 'item', item: equipment.item, cash: null),
          'cash' => EquipmentInfoWidget(
              equipmentList: StaticConfig.equipmentCashList,
              type: 'cash',
              item: null,
              cash: equipment.cash,
            ),
          'pet/symbol' => DetailPetWithSymbolInfo(pet: equipment.pet!, symbol: equipment.symbol!),
          _ => MainErrorPage(message: 'move Error'),
        },
      ],
    );
  }
}
