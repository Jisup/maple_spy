import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';

class EquipmentDetailRequiredLevelWidget extends ConsumerWidget {
  const EquipmentDetailRequiredLevelWidget({
    super.key,
    this.level,
  });

  final String? level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: DimenConfig.subDimen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: DimenConfig.subDimen),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '- REQ_LEV : ',
                    style: TextStyle(
                      color: level != null
                          ? ItemColor.subInfoText
                          : ItemColor.deactiveOptionText,
                      fontSize: FontConfig.subSize,
                      fontFamily: 'Maplestory',
                    ),
                  ),
                  TextSpan(
                    text: level ?? '0',
                    style: TextStyle(
                      color: level != null
                          ? ItemColor.subInfoText
                          : ItemColor.deactiveOptionText,
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
                margin: EdgeInsets.only(right: DimenConfig.subDimen),
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
    );
  }
}
