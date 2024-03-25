import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/item/item_detail_option_model.dart';
import 'package:maplespy/model/equipment/item/item_detail_potential_option_model.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_potential_option_page.dart';
import 'package:maplespy/provider/common_provider.dart';
import 'package:maplespy/widget/common/custom_text_widget.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_starforce_page.dart';
import 'package:maplespy/page/equipment/item/detail/item_detail_option_page.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_class_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_level_widget.dart';
import 'package:maplespy/widget/equipment/item/exceptional_enhance_widget.dart';
import 'package:maplespy/widget/main_container/detail_app_bar.dart';

class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({super.key, required this.item});

  final ItemEquipment item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final characterName = ref.read(characterNameProvider);
    final characterWorld = ref.read(characterWorldProvider);

    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
            context: context,
            characterName: characterName,
            characterWorld: characterWorld),
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
                              : const SizedBox.shrink(),

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
                              : const SizedBox.shrink(),

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
                                      style: const TextStyle(
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
                                      style: const TextStyle(
                                          color: ItemColor.commonInfoText)))
                              : const SizedBox.shrink(),

                          /**-----item etc info, ex) 교환 불가, 고유 장착 아이템 */
                        ],
                      ),
                    ),

                    /**-----item required */
                    const DashedDividerWidget(),
                    Container(
                      height: imageSize,
                      margin: EdgeInsets.only(
                          left: DimenConfig.commonDimen * 2,
                          right: DimenConfig.commonDimen * 2),
                      child: Row(
                        children: [
                          /**-----item image */
                          Container(
                            child: Stack(
                              children: [
                                item.potentialOptionGrade != null
                                    ? Positioned(
                                        right: 0,
                                        child: Transform.rotate(
                                          angle: -pi / 2,
                                          child: Transform.translate(
                                            offset: Offset(
                                                -FontConfig.minSize + 3,
                                                FontConfig.middleSize - 3),
                                            child: Icon(Icons.bookmark_sharp,
                                                size: FontConfig.middleSize,
                                                shadows: const [
                                                  BoxShadow(
                                                    offset: Offset(-2, 2),
                                                    color: Colors.black,
                                                  )
                                                ],
                                                color: StaticSwitchConfig
                                                        .potentialGradeDetailColor[
                                                    item.potentialOptionGrade]!),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                EquipmentDetailImageWidget(
                                    imageUrl: item.itemIcon!,
                                    grade: item.potentialOptionGrade),
                                item.specialRingLevel != null &&
                                        item.specialRingLevel != 0
                                    ? Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            left: DimenConfig.subDimen,
                                            bottom: DimenConfig.minDimen,
                                          ),
                                          child: ShaderMask(
                                            shaderCallback: (bounds) =>
                                                const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                  ItemColor.specialRingText,
                                                  Colors.white,
                                                ]).createShader(bounds),
                                            child: CustomTextWidget(
                                              text:
                                                  'Lv ${item.specialRingLevel}',
                                              size: FontConfig.maxSize,
                                              color: Colors.white,
                                              subColor: Colors.black54,
                                              shadowSize: 2,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                          EquipmentDetailRequiredLevelWidget(
                              level: item.itemBaseOption!.baseEquipmentLevel!
                                  .toInt()
                                  .toString())
                        ],
                      ),
                    ),
                    const EquipmentDetailRequiredClassWidget(),

                    /**-----item detail option with stat */
                    const DashedDividerWidget(),
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
                        ? const DashedDividerWidget()
                        : const SizedBox.shrink(),
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
                        : const SizedBox.shrink(),

                    /**-----item additional potential option */
                    item.additionalPotentialOptionGrade != null
                        ? const DashedDividerWidget()
                        : const SizedBox.shrink(),
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
                        : const SizedBox.shrink(),

                    /**-----item exceptional potential option */
                    item.itemExceptionalOption?.str != '0'
                        ? const DashedDividerWidget()
                        : const SizedBox.shrink(),
                    item.itemExceptionalOption?.str != '0'
                        ? ExceptionalEnhanceWidget(
                            exceptionalOprion: item.itemExceptionalOption!)
                        : const SizedBox.shrink(),

                    /**-----item soul */
                    item.soulName != null
                        ? const DashedDividerWidget()
                        : const SizedBox(),
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
                                        style: const TextStyle(
                                            color: ItemColor.commonInfoText)),
                                  ]),
                            ),
                          )
                        : const SizedBox.shrink(),
                    item.itemDescription != null
                        ? const DashedDividerWidget()
                        : const SizedBox(),
                    item.itemDescription != null
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: Text(
                                item.itemDescription!,
                                style: const TextStyle(
                                  color: ItemColor.commonInfoText,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    item.specialRingLevel != null && item.specialRingLevel != 0
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: Text(
                                '[특수 스킬 반지] ${item.itemName} ${item.specialRingLevel}레벨',
                                style: const TextStyle(
                                  color: ItemColor.etcInfoText,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    item.specialRingLevel != null && item.specialRingLevel != 0
                        ? const DashedDividerWidget()
                        : const SizedBox.shrink(),
                    item.specialRingLevel != null && item.specialRingLevel != 0
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: const Text(
                                '특수 스킬 반지는 중복 착용이 불가능합니다.',
                                style: TextStyle(
                                  color: ItemColor.etcInfoText,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
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
