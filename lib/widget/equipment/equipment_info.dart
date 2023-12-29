import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/model/equipment/cash_item_model.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/detail_cash_info.dart';
import 'package:maple_app/page/equipment/detail_item_info.dart';
import 'package:maple_app/page/main_error_page.dart';

class EquipmentInfoWidget extends ConsumerWidget {
  const EquipmentInfoWidget(
      {super.key,
      required this.equipmentList,
      required this.type,
      required this.item,
      required this.cash});

  final List equipmentList;
  final String type;
  final Item? item;
  final CashItem? cash;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
        padding: EdgeInsets.only(
            left: DimenConfig.subDimen, right: DimenConfig.subDimen),
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
                            'item' => DetailItemInfo(
                                name: slot['name'],
                                item: slot['slot'] == null
                                    ? null
                                    : item!.itemEquipment!.singleWhere(
                                        (element) =>
                                            element.itemEquipmentSlot ==
                                            slot['slot'],
                                        orElse: () => ItemEquipment())),
                            'cash' =>
                              DetailCashInfo(name: slot['name'], cash: cash!),
                            _ => MainErrorPage(
                                message: 'response equipment is error'),
                          }),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
