import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';

class ItemDetailRequiredLevelPage extends ConsumerWidget {
  const ItemDetailRequiredLevelPage({super.key, required this.level});

  final String level;

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
                      color: ItemColor.subInfoText,
                      fontSize: FontConfig.subSize,
                      fontFamily: 'Maplestory',
                    ),
                  ),
                  TextSpan(
                    text: level,
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
