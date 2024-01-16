import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/item/item_detail_option_model.dart';
import 'package:maplespy/model/equipment/item/item_detail_potential_option_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_potential_option_page.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_starforce_page.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_option_page.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_class_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_level_widget.dart';

class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({super.key, required this.item});

  final ItemEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    double imageSize = MediaQuery.of(context).size.width * 0.3;

    final ItemDetailOption detailOption = ItemDetailOption(
      part: item.itemEquipmentPart!,
      scrollUpgarde: item.scrollUpgrade!,
      itemTotalOption: item.itemTotalOption!,
      itemBaseOption: item.itemBaseOption!,
      itemAddOption: item.itemAddOption!,
      itemEtcOption: item.itemEtcOption!,
      itemStarforceOption: item.itemStarforceOption!,
      scrollUpgradeableCount: item.scrollUpgradeableCount!,
      scrollResilienceCount: item.scrollResilienceCount!,
      goldenHammerFlag: item.goldenHammerFlag!,
      cuttableCount: item.cuttableCount!,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.navigate_before_rounded,
              color: Colors.white,
              semanticLabel: '뒤로 가기 버튼',
            ),
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: DimenConfig.commonDimen * 2,
                    bottom: DimenConfig.commonDimen * 2),
                color: EquipmentColor.detailBackground,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: DimenConfig.commonDimen * 2,
                          right: DimenConfig.commonDimen * 2),
                      child: Column(
                        children: [
                          /**-----starforce */
                          item.starforce != '0'
                              ? ItemDetailStarforcePage(
                                  level: item
                                      .itemBaseOption!.baseEquipmentLevel!
                                      .toInt(),
                                  starforce: int.parse(item.starforce!),
                                )
                              : SizedBox.shrink(),

                          /**-----soul */
                          item.soulName != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: DimenConfig.subDimen,
                                  ),
                                  child: Text(
                                    (item.soulName!).splitMapJoin('소울 적용',
                                        onMatch: (m) => '',
                                        onNonMatch: (m) => '${m}'),
                                    style: TextStyle(
                                        color: ItemColor.addOptionText,
                                        fontSize: FontConfig.middleSize,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : SizedBox.shrink(),

                          /**-----item name + scroll upgrade */
                          Container(
                            margin: item.starforce != '0'
                                ? EdgeInsets.only(
                                    top: DimenConfig.subDimen,
                                  )
                                : EdgeInsets.zero,
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    fontSize: FontConfig.middleSize,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  /**-----item name */
                                  TextSpan(
                                      text: '${item.itemName}',
                                      style: TextStyle(
                                          color: item.scrollUpgrade != '0'
                                              ? ItemColor.upgradeOptionText
                                              : ItemColor.commonInfoText)),
                                  /**-----scroll upgrade */
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

                          /**-----item potential grade */
                          item.potentialOptionGrade != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: DimenConfig.subDimen,
                                  ),
                                  child: Text(
                                      '(${item.potentialOptionGrade} 아이템)',
                                      style: TextStyle(
                                          color: ItemColor.commonInfoText)))
                              : SizedBox.shrink(),

                          /**-----item etc info, ex) 교환 불가, 고유 장착 아이템 */
                        ],
                      ),
                    ),

                    /**-----item required */
                    DashedDividerWidget(),
                    Container(
                      height: imageSize,
                      margin: EdgeInsets.only(
                          left: DimenConfig.commonDimen * 2,
                          right: DimenConfig.commonDimen * 2),
                      child: Row(
                        children: [
                          /**-----item image */
                          EquipmentDetailImageWidget(
                              imageUrl: item.itemIcon!,
                              grade: item.potentialOptionGrade),
                          EquipmentDetailRequiredLevelWidget(
                              level: item.itemBaseOption!.baseEquipmentLevel!
                                  .toInt()
                                  .toString())
                        ],
                      ),
                    ),
                    EquipmentDetailRequiredClassWidget(),

                    /**-----item detail option with stat */
                    DashedDividerWidget(),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: DimenConfig.commonDimen * 2,
                            right: DimenConfig.commonDimen * 2),
                        child: ItemDetailOptionPage(detailOption: detailOption),
                      ),
                    ),

                    /**-----item potential option */
                    item.potentialOptionGrade != null
                        ? DashedDividerWidget()
                        : SizedBox.shrink(),
                    item.potentialOptionGrade != null
                        ? ItemDetailPotentialOptionPage(
                            type: true,
                            potentialOption: ItemDetailPotentialOption(
                              grade: item.potentialOptionGrade,
                              option1: item.potentialOption1,
                              option2: item.potentialOption2,
                              option3: item.potentialOption3,
                            ),
                          )
                        : SizedBox.shrink(),

                    /**-----item additional potential option */
                    item.additionalPotentialOptionGrade != null
                        ? DashedDividerWidget()
                        : SizedBox.shrink(),
                    item.additionalPotentialOptionGrade != null
                        ? ItemDetailPotentialOptionPage(
                            type: false,
                            potentialOption: ItemDetailPotentialOption(
                              grade: item.additionalPotentialOptionGrade,
                              option1: item.additionalPotentialOption1,
                              option2: item.additionalPotentialOption2,
                              option3: item.additionalPotentialOption3,
                            ),
                          )
                        : SizedBox.shrink(),

                    /**-----item soul */
                    item.soulName != null ? DashedDividerWidget() : SizedBox(),
                    item.soulName != null
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.soulName!,
                                        style: TextStyle(
                                            color: ItemColor.soulOptionText,
                                            fontSize: FontConfig.commonSize)),
                                    Text(item.soulOption!,
                                        style: TextStyle(
                                            color: ItemColor.commonInfoText)),
                                  ]),
                            ),
                          )
                        : SizedBox.shrink(),
                    item.itemDescription != null
                        ? DashedDividerWidget()
                        : SizedBox(),
                    item.itemDescription != null
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: Text(
                                item.itemDescription!,
                                style: TextStyle(
                                  color: ItemColor.commonInfoText,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
