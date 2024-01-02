import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_list_config.dart';
import 'package:maple_app/util/make_list.dart';

class ItemDetailRequiredClassPage extends ConsumerWidget {
  const ItemDetailRequiredClassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: EdgeInsets.only(
            top: DimenConfig.commonDimen,
            left: DimenConfig.commonDimen * 2,
            right: DimenConfig.commonDimen * 2),
        padding: EdgeInsets.all(DimenConfig.minDimen),
        decoration: BoxDecoration(
          color: ItemColor.detailClassBackground,
          border: Border.all(
            color: ItemColor.deactiveOptionText,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(RadiusConfig.minRadius)),
          boxShadow: fourDirectionBoxShadow(1, Colors.black, true),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: StaticListConfig.equipmentClassList.map(
              (className) {
                return Text(className,
                    style: TextStyle(color: ItemColor.commonInfoText));
              },
            ).toList()));
  }
}
