import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/android_item_model.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_class_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_level_widget.dart';

class AndroidItemDetailPage extends ConsumerWidget {
  const AndroidItemDetailPage({super.key, required this.androidItem});

  final AndroidItem androidItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    double imageSize = MediaQuery.of(context).size.width * 0.3;

    final AndroidPreset presetItem = androidItem.androidPreset1!;

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
                          /**-----item name + scroll upgrade */
                          Text(
                            '${presetItem.androidName}',
                            style: TextStyle(
                              color: ItemColor.commonInfoText,
                              fontSize: FontConfig.middleSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: DimenConfig.subDimen),
                            child: Text('${presetItem.androidNickname}',
                                style: TextStyle(
                                  color: ItemColor.etcInfoText,
                                  fontSize: FontConfig.middleDownSize,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),

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
                          Container(
                            child: Stack(
                              children: [
                                EquipmentDetailImageWidget(
                                  imageUrl: presetItem.androidIcon!,
                                ),
                              ],
                            ),
                          ),
                          EquipmentDetailRequiredLevelWidget(level: '10')
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('장비분류 : 안드로이드',
                                style: TextStyle(
                                  color: ItemColor.commonInfoText,
                                )),
                            Text('등급 : ${presetItem.androidGrade}',
                                style: TextStyle(
                                  color: ItemColor.commonInfoText,
                                )),
                          ],
                        ),
                      ),
                    ),
                    presetItem.androidDescription != null
                        ? DashedDividerWidget()
                        : SizedBox(),
                    presetItem.androidDescription != null
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: DimenConfig.commonDimen * 2,
                                  right: DimenConfig.commonDimen * 2),
                              child: Text(
                                presetItem.androidDescription!,
                                style: TextStyle(
                                  color: ItemColor.commonInfoText,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
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
