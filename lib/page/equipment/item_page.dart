import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_list_config.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/page/equipment/item/item_info.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/detail_page/detail_preset_tab.dart';

class ItemPage extends ConsumerWidget {
  const ItemPage({super.key, required this.item});

  final Item? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectItemTab = ref.watch(equipmentItemPresetProvider);

    final List<ItemEquipment>? itemList = switch (selectItemTab) {
      'main' => item?.itemEquipment,
      'preset1' => item?.itemEquipmentPreset1,
      'preset2' => item?.itemEquipmentPreset2,
      'preset3' => item?.itemEquipmentPreset3,
      _ => [],
    };

    return Container(
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: DimenConfig.commonDimen,
                        right: DimenConfig.commonDimen,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: StaticListConfig.itemPresetTabList
                            .map((tab) => DetailPresetTab(
                                tab: tab,
                                provider: equipmentItemPresetProvider,
                                isBright: false))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(DimenConfig.commonDimen),
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        children:
                            StaticListConfig.equipmentItemList.map((slot) {
                          return FractionallySizedBox(
                            widthFactor: 1 / 5.0125,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: slot['name'] != null
                                  ? ItemInfo(
                                      name: slot['name'],
                                      item: itemList?.singleWhere(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
