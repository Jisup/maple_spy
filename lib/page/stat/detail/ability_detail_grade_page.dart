import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/const_config.dart';
import 'package:maplespy/config/static_switch_config.dart';
import 'package:maplespy/util/make_list.dart';

class AbilityDetailGradePage extends ConsumerWidget {
  const AbilityDetailGradePage({super.key, required this.grade});

  final String? grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
        left: DimenConfig.commonDimen,
        right: DimenConfig.commonDimen,
        bottom: DimenConfig.commonDimen,
      ),
      padding: EdgeInsets.all(DimenConfig.commonDimen),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              StaticSwitchConfig.statStartBackgroundColor[grade]!,
              StaticSwitchConfig.statEndBackgroundColor[grade]!,
            ]),
        border: Border.all(color: StaticSwitchConfig.statBorderColor[grade]!),
        borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            offset: Offset(0, 2),
            color: StaticSwitchConfig.statBackgroundColor[grade]!,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: DimenConfig.subDimen),
              child: Icon(
                Icons.bookmark_sharp,
                color: Colors.white,
                shadows: customDirectionShadow(
                  direction: 'top_left',
                  d: 2,
                  color: StaticSwitchConfig.statBorderColor[grade]!,
                ),
              )),
          Text(
            '${grade} 어빌리티',
            style: TextStyle(
              fontSize: FontConfig.commonSize + 1,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(0, -1),
                  color: StaticSwitchConfig.statBorderColor[grade]!,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
