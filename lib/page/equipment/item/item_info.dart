import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/item_model.dart';

class ItemInfo extends ConsumerWidget {
  const ItemInfo({super.key, required this.name, required this.item});

  final String name;
  final ItemEquipment? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: item?.itemName != null
          ? () => context.push('/equipment/item/detail', extra: item)
          : null,
      child: Container(
        margin: EdgeInsets.all(DimenConfig.minDimen),
        padding: EdgeInsets.all(DimenConfig.subDimen),
        decoration: BoxDecoration(
            color: colorScheme.onSecondary,
            /**-----potential option grade */
            border: item?.potentialOptionGrade != null
                ? Border.all(
                    color: StaticSwitchConfig
                        .potentialGradeColor[item?.potentialOptionGrade]!,
                    width: 2,
                  )
                : null,
            /**-----potential option grade */
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
              /**-----potential option grade */
              item?.potentialOptionGrade != null
                  ? BoxShadow(
                      blurRadius: RadiusConfig.littleRadius,
                      color: StaticSwitchConfig
                          .potentialGradeColor[item?.potentialOptionGrade]!,
                      blurStyle: BlurStyle.outer,
                    )
                  : BoxShadow(),
            ]),
        child: Stack(
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: FontConfig.minSize,
                  letterSpacing: SpacingConfig.minSpacing,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
            /**-----item icon */
            item?.itemIcon != null
                ? SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage(item!.itemIcon!),
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
