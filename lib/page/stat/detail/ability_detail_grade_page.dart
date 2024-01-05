import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maple_app/config/color_config.dart';
import 'package:maple_app/config/const_config.dart';
import 'package:maple_app/config/static_switch_config.dart';
import 'package:maple_app/util/make_list.dart';

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
      decoration: grade != null
          ? BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    StaticSwitchConfig.statStartBackgroundColor[grade]!,
                    StaticSwitchConfig.statEndBackgroundColor[grade]!,
                  ]),
              border:
                  Border.all(color: StaticSwitchConfig.statBorderColor[grade]!),
              borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.solid,
                  offset: Offset(0, 2),
                  color: StaticSwitchConfig.statBackgroundColor[grade]!,
                )
              ],
            )
          : BoxDecoration(
              color: StatColor.statBackgroundColor,
              borderRadius: BorderRadius.circular(RadiusConfig.subRadius),
            ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: DimenConfig.subDimen),
            child: grade != null
                ? Icon(
                    Icons.bookmark_sharp,
                    color: Colors.white,
                    shadows: customDirectionShadow(
                      direction: 'top_left',
                      d: 2,
                      color: StaticSwitchConfig.statBorderColor[grade]!,
                    ),
                  )
                : Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
          ),
          grade != null
              ? Text(
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
              : Text(
                  '어빌리티가 활성화되지 않았습니다.',
                  style: TextStyle(
                    fontSize: FontConfig.commonSize + 1,
                    color: Colors.white,
                  ),
                )
        ],
      ),
    );
  }
}
