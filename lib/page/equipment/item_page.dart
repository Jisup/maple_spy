import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/page/equipment/item/item_info.dart';
import 'package:maplespy/provider/common_provider.dart';

class ItemPage extends ConsumerWidget {
  const ItemPage({super.key, required this.item});

  final Item? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 3) {
          ref
              .read(equipmentSelectTabProvider.notifier)
              .update((state) => 'cash');
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: EdgeInsets.only(
            left: DimenConfig.commonDimen, right: DimenConfig.commonDimen),
        child: LayoutBuilder(
          builder:
              (BuildContext childContext, BoxConstraints viewportConstraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: viewportConstraints.maxWidth,
                  minHeight: viewportConstraints.maxHeight),
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    children: StaticListConfig.equipmentItemList.map((slot) {
                      return FractionallySizedBox(
                        widthFactor: 1 / 5.0125,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: slot['name'] != null
                              ? ItemInfo(
                                  name: slot['name'],
                                  item: item?.itemEquipment?.singleWhere(
                                      (element) =>
                                          element.itemEquipmentSlot ==
                                          slot['slot'],
                                      orElse: () => ItemEquipment()))
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
