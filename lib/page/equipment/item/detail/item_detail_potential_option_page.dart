import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/equipment/item/item_detail_potential_option_model.dart';
import 'package:maple_app/widget/equipment/item/potential_grade_icon_widget.dart';

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
            Text(potentialOption.option1!,
                style: TextStyle(color: ItemColor.commonInfoText)),
            Text(potentialOption.option2!,
                style: TextStyle(color: ItemColor.commonInfoText)),
            Text(potentialOption.option3!,
                style: TextStyle(color: ItemColor.commonInfoText)),
          ],
        ),
      ),
    );
  }
}
