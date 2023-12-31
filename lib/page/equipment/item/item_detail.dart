import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/item/item_starforce.dart';
import 'package:maple_app/page/equipment/item/item_stat_option.dart';

class ItemDetail extends ConsumerWidget {
  const ItemDetail({super.key, required this.item});

  final ItemEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: DimenConfig.commonDimen * 2, bottom: DimenConfig.commonDimen * 2),
          color: ItemColor.detailBackground,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    ItemStarforce(
                      level: item.itemBaseOption!.baseEquipmentLevel!.toInt(),
                      starforce: int.parse(item.starforce!),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: DimenConfig.subDimen, bottom: DimenConfig.subDimen),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: FontConfig.middleSize, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: '${item.itemName}', style: TextStyle(color: ItemColor.upgradeOptionText)),
                            TextSpan(text: item.scrollUpgrade! != '0' ? ' (+${item.scrollUpgrade})' : '', style: TextStyle(color: ItemColor.upgradeOptionText)),
                          ],
                        ),
                      ),
                    ),
                    item.potentialOptionGrade != null ? Container(margin: EdgeInsets.only(top: DimenConfig.subDimen, bottom: DimenConfig.subDimen), child: Text('(${item.potentialOptionGrade} 아이템)', style: TextStyle(color: ItemColor.commonInfoText))) : SizedBox.shrink(),
                  ],
                ),
              ),
              /**-----needs a line */
              Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        FractionallySizedBox(
                            widthFactor: 0.3,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                padding: EdgeInsets.all(DimenConfig.commonDimen),
                                decoration: BoxDecoration(border: Border.all(color: StaticSwitchConfig.potentialGradeDetailColor[item.potentialOptionGrade]!)),
                                child: Image.network(
                                  item.itemIcon!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )),
                        Text('- REQ_LEV: ${item.itemBaseOption!.baseEquipmentLevel?.toInt()}', style: TextStyle(color: ItemColor.subInfoText))
                      ],
                    ),
                    Row(children: [
                      Text('초보자', style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('전사', style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('마법사', style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('궁수', style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('도적', style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('해적', style: TextStyle(color: ItemColor.commonInfoText)),
                    ]),
                  ],
                ),
              ),

              /**-----needs a line */
              Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    Text('장비분류 : ${item.itemEquipmentPart}', style: TextStyle(color: ItemColor.commonInfoText)),
                    ItemStatOption(stat: 'STR', total: item.itemTotalOption!.str!, base: item.itemBaseOption!.str!, add: item.itemAddOption!.str!, etc: item.itemEtcOption!.str!, starforce: item.itemStarforceOption!.str!),
                    ItemStatOption(stat: 'DEX', total: item.itemTotalOption!.dex!, base: item.itemBaseOption!.dex!, add: item.itemAddOption!.dex!, etc: item.itemEtcOption!.dex!, starforce: item.itemStarforceOption!.dex!),
                    ItemStatOption(stat: 'INT', total: item.itemTotalOption!.int!, base: item.itemBaseOption!.int!, add: item.itemAddOption!.int!, etc: item.itemEtcOption!.int!, starforce: item.itemStarforceOption!.int!),
                    ItemStatOption(stat: 'LUK', total: item.itemTotalOption!.luk!, base: item.itemBaseOption!.luk!, add: item.itemAddOption!.luk!, etc: item.itemEtcOption!.luk!, starforce: item.itemStarforceOption!.luk!),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: '업그레이드 가능 횟수 : ${item.scrollUpgradeableCount}', style: TextStyle(color: ItemColor.commonInfoText)),
                      TextSpan(text: ' '),
                      TextSpan(text: '(복구 가능 횟수 : ${item.scrollResilienceCount})', style: TextStyle(color: ItemColor.subInfoText)),
                    ])),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            StaticSwitchConfig.potentialGradeCircleText[item.potentialOptionGrade]!,
                            style: TextStyle(color: ItemColor.commonInfoText),
                          ),
                        ),
                        Text('잠재옵션', style: TextStyle(color: StaticSwitchConfig.potentialGradeColor[item.potentialOptionGrade]))
                      ],
                    ),
                    Text(item.potentialOption1!, style: TextStyle(color: ItemColor.commonInfoText)),
                    Text(item.potentialOption2!, style: TextStyle(color: ItemColor.commonInfoText)),
                    Text(item.potentialOption3!, style: TextStyle(color: ItemColor.commonInfoText)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: DimenConfig.commonDimen * 2, right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(StaticSwitchConfig.potentialGradeCircleText[item.additionalPotentialOptionGrade]!, style: TextStyle(color: ItemColor.commonInfoText)),
                        ),
                        Text('에디셔널 잠재옵션', style: TextStyle(color: StaticSwitchConfig.potentialGradeColor[item.additionalPotentialOptionGrade]))
                      ],
                    ),
                    Text(item.additionalPotentialOption1!, style: TextStyle(color: ItemColor.commonInfoText)),
                    Text(item.additionalPotentialOption2!, style: TextStyle(color: ItemColor.commonInfoText)),
                    Text(item.additionalPotentialOption3!, style: TextStyle(color: ItemColor.commonInfoText)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
