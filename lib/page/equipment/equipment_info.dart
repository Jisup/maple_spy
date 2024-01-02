import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/model/main_equipment_model.dart';
import 'package:maple_app/page/equipment/pet_with_symbol_info.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/widget/detail_page/detail_select_tab.dart';
import 'package:maple_app/widget/equipment/equipment_info_widget.dart';

class EquipmentInfo extends ConsumerWidget {
  const EquipmentInfo({super.key, required this.equipment});

  final MainEquipment equipment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectTab = ref.watch(equipmentSelectTabProvider);
    return Column(
      children: [
        DetailSelectTabWidget(
          tabList: StaticListConfig.detailEquipmentTabList,
          provider: equipmentSelectTabProvider,
        ),
        Expanded(
          child: switch (selectTab) {
            'item' => EquipmentInfoWidget(
                equipmentList: StaticListConfig.equipmentItemList,
                type: 'item',
                item: equipment.item,
                cash: null),
            'cash' => EquipmentInfoWidget(
                equipmentList: StaticListConfig.equipmentCashList,
                type: 'cash',
                item: null,
                cash: equipment.cash,
              ),
            'pet/symbol' =>
              PetWithSymbolInfo(pet: equipment.pet!, symbol: equipment.symbol!),
            _ => MainErrorPage(message: 'move Error'),
          },
        ),
      ],
    );
  }
}
