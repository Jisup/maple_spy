import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/widget/equipment/equipment_empty_detail.dart';

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
                border: Border.all(
                  color: StaticSwitchConfig.potentialGradeColor[item?.potentialOptionGrade]!,
                  width: item?.potentialOptionGrade == null ? 0 : 2,
                ),
                borderRadius: item?.potentialOptionGrade == null ? BorderRadius.circular(RadiusConfig.subRadius) : null,
                boxShadow: [
                  BoxShadow(blurRadius: RadiusConfig.subRadius, offset: Offset(-3, -3), color: Colors.white, inset: true),
                  BoxShadow(blurRadius: RadiusConfig.subRadius, offset: Offset(3, 3), color: Colors.black87, inset: true),
                  BoxShadow(
                    blurRadius: RadiusConfig.littleRadius,
                    color: StaticSwitchConfig.potentialGradeColor[item?.potentialOptionGrade]!,
                    blurStyle: BlurStyle.outer,
                  )
                ]),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(DimenConfig.subDimen),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: FontConfig.minSize, letterSpacing: SpacingConfig.minSpacing, color: Colors.white70, fontWeight: FontWeight.bold),
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
        : EquipmentEmptyDetailWidget(name: name);
  }
}
