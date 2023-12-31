import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/model/equipment/item_model.dart';
import 'package:maple_app/page/equipment/item/item_starforce.dart';
import 'package:maple_app/page/equipment/item/item_stat_option.dart';
import 'package:maple_app/widget/equipment/item/potential_grade_icon_widget.dart';

class ItemDetail extends ConsumerWidget {
  const ItemDetail({super.key, required this.item});

  final ItemEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    double imageSize = MediaQuery.of(context).size.width * 0.3;

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
          padding: EdgeInsets.only(
              top: DimenConfig.commonDimen * 2,
              bottom: DimenConfig.commonDimen * 2),
          color: ItemColor.detailBackground,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: DimenConfig.commonDimen * 2,
                    right: DimenConfig.commonDimen * 2),
                child: Column(
                  children: [
                    ItemStarforce(
                      level: item.itemBaseOption!.baseEquipmentLevel!.toInt(),
                      starforce: int.parse(item.starforce!),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: DimenConfig.subDimen,
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: FontConfig.middleSize,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: '${item.itemName}',
                                style: TextStyle(
                                    color: ItemColor.upgradeOptionText)),
                            TextSpan(
                                text: item.scrollUpgrade! != '0'
                                    ? ' (+${item.scrollUpgrade})'
                                    : '',
                                style: TextStyle(
                                    color: ItemColor.upgradeOptionText)),
                          ],
                        ),
                      ),
                    ),
                    item.potentialOptionGrade != null
                        ? Container(
                            margin: EdgeInsets.only(
                              top: DimenConfig.subDimen,
                            ),
                            child: Text('(${item.potentialOptionGrade} 아이템)',
                                style:
                                    TextStyle(color: ItemColor.commonInfoText)))
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              /**-----needs a line */
              Container(
                height: imageSize,
                margin: EdgeInsets.only(
                    left: DimenConfig.commonDimen * 2,
                    right: DimenConfig.commonDimen * 2),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(DimenConfig.commonDimen),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: StaticSwitchConfig
                                        .potentialGradeDetailColor[
                                    item.potentialOptionGrade]!)),
                        child: Image.network(
                          item.itemIcon!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: DimenConfig.subDimen),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(bottom: DimenConfig.subDimen),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '- REQ_LEV : ',
                                    style: TextStyle(
                                      color: ItemColor.subInfoText,
                                      fontSize: FontConfig.subSize,
                                      fontFamily: 'Maplestory',
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${item.itemBaseOption!.baseEquipmentLevel!.toInt()}',
                                    style: TextStyle(
                                      color: ItemColor.subInfoText,
                                      fontSize: FontConfig.subSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: DimenConfig.subDimen),
                                child: Column(
                                  children: [
                                    Text(
                                      '- REQ STR : 000',
                                      style: TextStyle(
                                          color: ItemColor.deactiveOptionText,
                                          fontSize: FontConfig.minSize,
                                          fontFamily: 'Maplestory'),
                                    ),
                                    Text(
                                      '- REQ INT : 000',
                                      style: TextStyle(
                                          color: ItemColor.deactiveOptionText,
                                          fontSize: FontConfig.minSize,
                                          fontFamily: 'Maplestory'),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '- REQ DEX : 000',
                                    style: TextStyle(
                                        color: ItemColor.deactiveOptionText,
                                        fontSize: FontConfig.minSize,
                                        fontFamily: 'Maplestory'),
                                  ),
                                  Text(
                                    '- REQ LUK : 000',
                                    style: TextStyle(
                                        color: ItemColor.deactiveOptionText,
                                        fontSize: FontConfig.minSize,
                                        fontFamily: 'Maplestory'),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(RadiusConfig.minRadius)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(-1, -1),
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(-1, 1),
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, -1),
                      ),
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('초보자',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('전사',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('마법사',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('궁수',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('도적',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text('해적',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                    ]),
              ),

              /**-----needs a line */
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  margin: EdgeInsets.only(
                      left: DimenConfig.commonDimen * 2,
                      right: DimenConfig.commonDimen * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('장비분류 : ${item.itemEquipmentPart}',
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      ItemStatOption(
                          stat: 'STR',
                          total: item.itemTotalOption!.str!,
                          base: item.itemBaseOption!.str!,
                          add: item.itemAddOption!.str!,
                          etc: item.itemEtcOption!.str!,
                          starforce: item.itemStarforceOption!.str!),
                      ItemStatOption(
                          stat: 'DEX',
                          total: item.itemTotalOption!.dex!,
                          base: item.itemBaseOption!.dex!,
                          add: item.itemAddOption!.dex!,
                          etc: item.itemEtcOption!.dex!,
                          starforce: item.itemStarforceOption!.dex!),
                      ItemStatOption(
                          stat: 'INT',
                          total: item.itemTotalOption!.int!,
                          base: item.itemBaseOption!.int!,
                          add: item.itemAddOption!.int!,
                          etc: item.itemEtcOption!.int!,
                          starforce: item.itemStarforceOption!.int!),
                      ItemStatOption(
                          stat: 'LUK',
                          total: item.itemTotalOption!.luk!,
                          base: item.itemBaseOption!.luk!,
                          add: item.itemAddOption!.luk!,
                          etc: item.itemEtcOption!.luk!,
                          starforce: item.itemStarforceOption!.luk!),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text:
                                '업그레이드 가능 횟수 : ${item.scrollUpgradeableCount}',
                            style: TextStyle(color: ItemColor.commonInfoText)),
                        TextSpan(text: ' '),
                        TextSpan(
                            text: '(복구 가능 횟수 : ${item.scrollResilienceCount})',
                            style: TextStyle(color: ItemColor.subInfoText)),
                      ])),
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
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
                              potentialGrade: item.potentialOptionGrade!),
                          Text('잠재옵션',
                              style: TextStyle(
                                  color: StaticSwitchConfig.potentialGradeColor[
                                      item.potentialOptionGrade]))
                        ],
                      ),
                      Text(item.potentialOption1!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text(item.potentialOption2!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text(item.potentialOption3!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
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
                            potentialGrade:
                                item.additionalPotentialOptionGrade!,
                          ),
                          Text('에디셔널 잠재옵션',
                              style: TextStyle(
                                  color: StaticSwitchConfig.potentialGradeColor[
                                      item.additionalPotentialOptionGrade]))
                        ],
                      ),
                      Text(item.additionalPotentialOption1!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text(item.additionalPotentialOption2!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                      Text(item.additionalPotentialOption3!,
                          style: TextStyle(color: ItemColor.commonInfoText)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
