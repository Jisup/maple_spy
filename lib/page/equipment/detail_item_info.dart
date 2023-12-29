import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/widget/equipment/equipment_info.dart';

class DetailItemInfo extends ConsumerWidget {
  const DetailItemInfo({super.key, required this.name, required this.item});

  final String name;
  final ItemEquipment? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return item?.itemName != null
        //**-----item value가 있는 경우 그대로 표현 */
        ? Container(
            margin: EdgeInsets.all(DimenConfig.subDimen),
            decoration: BoxDecoration(
                color: colorScheme.onSecondary,
                border: item?.potentialOptionGrade != null
                    ? Border.all(
                        color: switch (item?.potentialOptionGrade) {
                          '레전드리' => ItemColor.legendaryPotentialBorder,
                          '유니크' => ItemColor.uniquePotentialBorder,
                          '에픽' => ItemColor.epicPotentialBorder,
                          '레어' => ItemColor.rarePotentialBorder,
                          _ => Colors.white,
                        },
                        width: 2,
                      )
                    : null,
                borderRadius: item?.potentialOptionGrade == null
                    ? BorderRadius.circular(RadiusConfig.subRadius)
                    : null,
                boxShadow: [
                  BoxShadow(
                      blurRadius: RadiusConfig.subRadius,
                      offset: Offset(-3, -3),
                      color: Colors.white,
                      inset: true),
                  BoxShadow(
                      blurRadius: RadiusConfig.subRadius,
                      offset: Offset(3, 3),
                      color: Colors.black87,
                      inset: true),
                  BoxShadow(
                    blurRadius: RadiusConfig.littleRadius,
                    color: item?.potentialOptionGrade != null
                        ? switch (item?.potentialOptionGrade) {
                            '레전드리' => ItemColor.legendaryPotentialBorder,
                            '유니크' => ItemColor.uniquePotentialBorder,
                            '에픽' => ItemColor.epicPotentialBorder,
                            '레어' => ItemColor.rarePotentialBorder,
                            _ => Colors.white,
                          }
                        : Colors.transparent,
                    blurStyle: BlurStyle.outer,
                  )
                ]),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: FontConfig.minSize,
                        letterSpacing: SpacingConfig.minSpacing,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage(item!.itemIcon!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          )
        //**-----item null은 빈 slot만 보여주기 */
        : Container(
            margin: EdgeInsets.all(DimenConfig.subDimen),
            padding: EdgeInsets.all(DimenConfig.subDimen),
            decoration: BoxDecoration(
                color: colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
                boxShadow: [
                  BoxShadow(
                      blurRadius: RadiusConfig.subRadius,
                      offset: Offset(-3, -3),
                      color: Colors.white,
                      inset: true),
                  BoxShadow(
                      blurRadius: RadiusConfig.subRadius,
                      offset: Offset(3, 3),
                      color: Colors.black87,
                      inset: true)
                ]),
            child: Stack(
              children: [
                Text(name,
                    style: TextStyle(
                        fontSize: FontConfig.minSize,
                        letterSpacing: SpacingConfig.minSpacing,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          );
  }
}
