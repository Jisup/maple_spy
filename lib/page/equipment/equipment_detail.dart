import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/static_config.dart';
import 'package:maple_app/model/main_equipment_model.dart';
import 'package:maple_app/page/equipment/detail_cash_info.dart';
import 'package:maple_app/page/equipment/detail_item_info.dart';
import 'package:maple_app/page/equipment/detail_pet_with_symbol_info.dart';
import 'package:maple_app/page/main_error_page.dart';
import 'package:maple_app/provider/equipment_notifier.dart';
import 'package:maple_app/widget/detail_page/detail_select_tab.dart';

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
          'item' => EquipmentDetailItem(),
          'cash' => EquipmentDetailCash(),
          'pet/symbol' => EquipmentDetailPetWithSymbol(),
          _ => MainErrorPage(message: 'move Error'),
        },
      ],
    );
  }
}
