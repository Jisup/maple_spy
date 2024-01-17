import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/model/equipment/item_model.dart';
import 'package:maplespy/util/make_list.dart';

class ExceptionalEnhanceWidget extends ConsumerWidget {
  const ExceptionalEnhanceWidget({super.key, required this.exceptionalOprion});

  final ItemExceptionalOption exceptionalOprion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        margin: EdgeInsets.only(
          left: DimenConfig.commonDimen * 2,
          right: DimenConfig.commonDimen * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Semantics(
                  label: '익셉셔널 강화 아이콘',
                  readOnly: true,
                  child: Container(
                    margin: EdgeInsets.only(right: DimenConfig.commonDimen),
                    decoration: BoxDecoration(
                      color: ItemColor.exceptionalIconBackground,
                      border:
                          Border.all(color: ItemColor.exceptionalIconBorder),
                      borderRadius: BorderRadius.circular(DimenConfig.subDimen),
                      boxShadow: fourDirectionBoxShadow(
                          d: 1, color: ItemColor.iconBoxShadow),
                    ),
                    child: SizedBox(
                      width: FontConfig.minSize * 2,
                      height: FontConfig.minSize * 1.5,
                      child: Center(
                        child: Text(
                          'EX',
                          style: TextStyle(
                              color: ItemColor.commonInfoText,
                              fontSize: FontConfig.minSize,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              shadows: eightDirectionShadow(
                                d: 2,
                                color: ItemColor.exceptionalIconTextShadow,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('익셉셔널 강화',
                    style: TextStyle(color: ItemColor.exceptionalPotentialText))
              ],
            ),
            Text(
              '올스탯 : +${exceptionalOprion.str}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '최대 HP / 최대 MP : +${exceptionalOprion.maxHp}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '공격력 / 마력 : +${exceptionalOprion.attackPower}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '익셉셔널 강화 1회 적용 (최대 1회 강화 가능)',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
