import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/item/item_info.dart';

class ItemPage extends ConsumerWidget {
  const ItemPage({super.key, required this.item});

  final Item? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
          left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
      padding: EdgeInsets.only(
          left: DimenConfig.subDimen, right: DimenConfig.subDimen),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        children: StaticListConfig.equipmentItemList.map((slot) {
          return FractionallySizedBox(
            widthFactor: 1 / 5,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: slot['name'] != null
                  ? ItemInfo(
                      name: slot['name'],
                      item: item?.itemEquipment?.singleWhere(
                          (element) =>
                              element.itemEquipmentSlot == slot['slot'],
                          orElse: () => ItemEquipment()))
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}
