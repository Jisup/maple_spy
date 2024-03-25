import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/model/equipment/cash_item_model.dart';
import 'package:maplespy/page/equipment/cash/detail/cash_detail_option_page.dart';
import 'package:maplespy/widget/common/dashed_divider_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_image_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_class_widget.dart';
import 'package:maplespy/widget/equipment/detail/equipment_detail_required_level_widget.dart';

class CashDetailPage extends ConsumerWidget {
  const CashDetailPage({
    super.key,
    required this.cashItem,
  });

  final CashItemEquipment cashItem;

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
              child: const Icon(
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
                      /**-----cash name */
                      Text(
                        cashItem.cashItemName!,
                        style: TextStyle(
                          fontSize: FontConfig.middleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      /**-----cash label */
                      cashItem.cashItemLabel != null
                          ? Container(
                              margin:
                                  EdgeInsets.only(top: DimenConfig.subDimen),
                              child: Text(
                                cashItem.cashItemLabel!,
                                style: TextStyle(
                                  fontSize: FontConfig.commonSize,
                                  color: StaticSwitchConfig
                                      .labelTextColor[cashItem.cashItemLabel],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      /**-----cash exfire */
                      cashItem.dateOptionExpire != null
                          ? Container(
                              margin:
                                  EdgeInsets.only(top: DimenConfig.subDimen),
                              child: Text(
                                cashItem.cashItemLabel != null
                                    ? '옵션 유효기간 : ${cashItem.dateOptionExpire}'
                                    : '${cashItem.dateOptionExpire}까지 사용가능',
                                style: TextStyle(
                                  fontSize: FontConfig.commonSize,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),

                      /**-----cash image + required */
                      const DashedDividerWidget(),
                      Container(
                        height: imageSize,
                        margin: EdgeInsets.only(
                            left: DimenConfig.commonDimen * 2,
                            right: DimenConfig.commonDimen * 2),
                        child: Row(
                          children: [
                            /**-----item image */
                            EquipmentDetailImageWidget(
                              imageUrl: cashItem.cashItemIcon!,
                              label: cashItem.cashItemLabel ?? '캐시',
                            ),
                            const EquipmentDetailRequiredLevelWidget(),
                          ],
                        ),
                      ),
                      const EquipmentDetailRequiredClassWidget(),
                      /**-----cash detail option */
                      const DashedDividerWidget(),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: DimenConfig.commonDimen * 2,
                              right: DimenConfig.commonDimen * 2),
                          child: CashDetailOptionPage(
                            part: cashItem.cashItemEquipmentPart!,
                            options: cashItem.cashItemOption,
                            label: cashItem.cashItemLabel != null,
                          ),
                        ),
                      ),

                      /**-----cash description */
                      cashItem.cashItemDescription != null
                          ? const DashedDividerWidget()
                          : const SizedBox.shrink(),
                      cashItem.cashItemDescription != null
                          ? FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: DimenConfig.commonDimen * 2,
                                      right: DimenConfig.commonDimen * 2),
                                  child: Text(cashItem.cashItemDescription!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ))))
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
