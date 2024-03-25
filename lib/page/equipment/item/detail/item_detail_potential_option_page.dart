import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/item/item_detail_potential_option_model.dart';
import 'package:maplespy/widget/equipment/item/potential_grade_icon_widget.dart';

class ItemDetailPotentialOptionPage extends ConsumerWidget {
  const ItemDetailPotentialOptionPage(
      {super.key, required this.type, required this.potentialOption});

  final bool type; // true: basic, false: additional
  final ItemDetailPotentialOption potentialOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        margin: EdgeInsets.only(
            left: DimenConfig.commonDimen * 2,
            right: DimenConfig.commonDimen * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PotentialGradeIconWidget(
                    potentialGrade: potentialOption.grade!),
                Text(type ? '잠재옵션' : '에디셔널 잠재옵션',
                    style: TextStyle(
                        color: StaticSwitchConfig
                            .potentialGradeColor[potentialOption.grade]))
              ],
            ),
            potentialOption.option1 != null
                ? Text(potentialOption.option1!,
                    style: const TextStyle(color: ItemColor.commonInfoText))
                : const SizedBox.shrink(),
            potentialOption.option2 != null
                ? Text(potentialOption.option2!,
                    style: const TextStyle(color: ItemColor.commonInfoText))
                : const SizedBox.shrink(),
            potentialOption.option3 != null
                ? Text(potentialOption.option3!,
                    style: const TextStyle(color: ItemColor.commonInfoText))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
