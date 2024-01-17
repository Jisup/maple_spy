import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/pet_item_model.dart';
import 'package:maplespy/page/equipment/pet_symbol/pet/detail/pet_equipment_item_detail_option_page.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_class_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_level_widget.dart';

class PetEquipmentItemDetailPage extends ConsumerWidget {
  const PetEquipmentItemDetailPage(
      {super.key, required this.equipment, required this.petType});

  final PetEquipment equipment;
  final String? petType;

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
                semanticLabel: '뒤로 가기 버튼',
              )),
        ),
        body: LayoutBuilder(
          builder:
              (BuildContext childContext, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                    padding: EdgeInsets.only(
                      top: DimenConfig.commonDimen * 2,
                      bottom: DimenConfig.commonDimen * 2,
                    ),
                    color: EquipmentColor.detailBackground,
                    child: Column(
                      children: [
                        /**-----name + upgrade scroll */
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontSize: FontConfig.middleSize,
                                fontWeight: FontWeight.bold),
                            children: [
                              /**-----item name */
                              TextSpan(
                                  text: '${equipment.itemName}',
                                  style: TextStyle(
                                      color: equipment.scrollUpgrade != '0'
                                          ? ItemColor.etcInfoText
                                          : ItemColor.commonInfoText)),
                              /**-----scroll upgrade */
                              TextSpan(
                                  text: equipment.scrollUpgrade! != '0'
                                      ? ' (+${equipment.scrollUpgrade})'
                                      : '',
                                  style:
                                      TextStyle(color: ItemColor.etcInfoText)),
                            ],
                          ),
                        ),
                        /**-----image + required */
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
                                imageUrl: equipment.itemIcon!,
                                label: '캐시',
                              ),
                              EquipmentDetailRequiredLevelWidget()
                            ],
                          ),
                        ),
                        EquipmentDetailRequiredClassWidget(),
                        /**-----options */
                        equipment.itemOption?.length != 0
                            ? DashedDividerWidget()
                            : SizedBox.shrink(),
                        equipment.itemOption?.length != 0
                            ? FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: DimenConfig.commonDimen * 2,
                                      right: DimenConfig.commonDimen * 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('장비분류 : 펫장비',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      PetEquipmentItemDetailOptionPage(
                                        petType: petType,
                                        options: equipment.itemOption!,
                                      ),
                                    ],
                                  ),
                                ))
                            : SizedBox.shrink(),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: DimenConfig.commonDimen * 2,
                              right: DimenConfig.commonDimen * 2,
                            ),
                            child: Text(
                              '업그레이드 가능 횟수 : ${equipment.scrollUpgradable}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        /**-----description */
                        equipment.itemDescription != null
                            ? DashedDividerWidget()
                            : SizedBox.shrink(),
                        equipment.itemDescription != null
                            ? FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                    margin: EdgeInsets.only(
                                      left: DimenConfig.commonDimen * 2,
                                      right: DimenConfig.commonDimen * 2,
                                    ),
                                    child: Text(
                                      equipment.itemDescription!,
                                      style: TextStyle(color: Colors.white),
                                    )))
                            : SizedBox.shrink()
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
