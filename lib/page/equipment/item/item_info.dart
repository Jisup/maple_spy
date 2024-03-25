import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';

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
      child: Semantics(
        label:
            '${name} 아이템 칸, ${item != null ? '${item!.potentialOptionGrade != null ? '${item!.potentialOptionGrade} 잠재능력을 지닌 ' : ''}${item!.itemName}' : '비어있음'}',
        button: true,
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
                    offset: const Offset(-3, -3),
                    color: Colors.white,
                    inset: true),
                BoxShadow(
                    blurRadius: RadiusConfig.subRadius,
                    offset: const Offset(3, 3),
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
                    : const BoxShadow(),
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
                        semanticLabel: '${item!.itemName!} 이미지',
                      ),
                    )
                  : const SizedBox.shrink(),
              /**-----item ring level */
              item?.specialRingLevel != null && item?.specialRingLevel != 0
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ItemColor.specialRingText,
                              Colors.white,
                            ]).createShader(bounds),
                        child: CustomTextWidget(
                          text: 'Lv ${item!.specialRingLevel}',
                          size: FontConfig.middleDownSize,
                          color: Colors.white,
                          subColor: Colors.black54,
                          shadowSize: 2,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
